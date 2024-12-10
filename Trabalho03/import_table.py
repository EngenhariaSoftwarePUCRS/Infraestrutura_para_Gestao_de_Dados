import csv
import os
import psycopg2
import sys
import threading
from dotenv import load_dotenv
from psycopg2.extras import execute_values
from queue import Queue

# Load environment variables from .env file
load_dotenv()

# Default file prefix path
file_prefix_path = os.path.join('dumps') # os.path.join('mbdump', 'mbdump')

# Lock for thread synchronization
lock = threading.Lock()

# List of files removed (to remove just once)
files_removed = []


def get_connection():
    try:
        return psycopg2.connect(
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            host=os.getenv('DB_HOST'),
            port=os.getenv('DB_PORT'),
            database=os.getenv('DB_NAME')
        )
    
    except Exception as e:
        print(f"Error connecting to database: {str(e)}")
        return None

# Establish database connection
conn = get_connection()


def write_sql_insert(table_name, query, rows, delete_file=True):
    file_path = os.path.join('sql', f"Insert_{table_name}.sql")

    with lock:
        if delete_file and file_path not in files_removed:
            if os.path.exists(file_path):
                os.remove(file_path)
                files_removed.append(file_path)

        try:
            with open(file_path, 'a', encoding='utf-8') as f:
                f.write(query)

                formatted_rows = []
                for row in rows:
                    # Format each row into SQL value syntax
                    remove_quotes = lambda x: x.replace('\'', '').replace('\'\'', '').replace('"', '')
                    formatted_row = ', '.join(
                        [f"'{remove_quotes(str(value))}'" if value is not None else 'NULL' for value in row]
                    )
                    formatted_rows.append(f"({formatted_row})")

                f.write(',\n'.join(formatted_rows))
                f.write(';\n')

            print(f"SQL insert for {table_name} written to {file_path}")

        except Exception as e:
            print(f"Error writing SQL insert for {table_name}: {str(e)}")


def import_csv_to_table(table_name, column_names, thread_count = 1, parent_id_index = None, sorter = None):
    global conn, file_prefix_path
    
    file_path = os.path.join(file_prefix_path, table_name)

    def process_chunk(thread_id, rows):
        thread_conn = get_connection()

        try:
            success_count = 0
            error_count = 0

            cursor = thread_conn.cursor()

            query = f"INSERT INTO {table_name} ({', '.join(column_names)}) VALUES"

            # Handle NULL values
            rows = [[None if value == '\\N' else value for value in row] for row in rows]

            write_sql_insert(table_name, f'{query}\n', rows)

            try:
                execute_values(cursor, f'{query} %s', rows)
                thread_conn.commit()
                success_count = len(rows)
            
            except Exception as e:
                with lock:
                    print(f"[{thread_id}] encountered an error while inserting: {str(e)}. Retrying.")
                for row in rows:
                    try:
                        execute_values(cursor, f'{query} %s', [row])
                        thread_conn.commit()
                        with lock:
                            success_count += 1
                        print(f"\r[{thread_id}] Successful insertions: {success_count}")
                    except Exception as e:
                        with lock:
                            print(f"[{thread_id}] encountered an error while inserting: {str(e)}")
                        # Get parent id from the row
                        if parent_id_index:
                            parent_id = row[parent_id_index]
                            print(f"\nPossible failure for ppid: {parent_id}, {e}")
                            # Look for the parent id in the rows
                            if parent_id is not None:
                                parent_row = next((r for r in rows if r[0] == parent_id), None)
                                print(f"[{thread_id}] Parent row: {'found' if parent_row else 'not found'}")
                                # If parent row is found, insert it first
                                if parent_row is not None:
                                    try:
                                        execute_values(cursor, f'{query} %s', [parent_row])
                                        thread_conn.commit()
                                        with lock:
                                            success_count += 1
                                    except Exception as e:
                                        with lock:
                                            error_count += 1
                                # If parent row is not found, insert the row with NULL parent
                                else:
                                    row[1] = None
                                    try:
                                        execute_values(cursor, f'{query} %s', [row])
                                        thread_conn.commit()
                                        with lock:
                                            success_count += 1
                                    except Exception as e:
                                        with lock:
                                            error_count += 1
                        
                        thread_conn.rollback()
        
            with lock:
                print(f"[{thread_id}] completed: {success_count} rows inserted, {error_count} rows failed")

        except Exception as e:
            with lock:
                print(f"[{thread_id}] encountered an error: {str(e)}")
            thread_conn.rollback()

        finally:
            cursor.close()

    try:
        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            reader = list(csv.reader(f, delimiter='\t'))
        
        if sorter is not None:
            reader.sort(key=sorter)
        
        total_lines = len(reader)
        print(f"\nPreparing to insert {total_lines} rows into {table_name} table using {thread_count} threads")

        chunk_size = (total_lines + thread_count - 1) // thread_count
        threads = []

        for i in range(thread_count):
            start_index = i * chunk_size
            end_index = min((i + 1) * chunk_size, total_lines)
            chunk = reader[start_index:end_index]
            thread = threading.Thread(target=process_chunk, args=(i, chunk))
            threads.append(thread)
            thread.start()

        # Wait for all threads to finish
        for thread in threads:
            thread.join()

    except Exception as e:
        print(f"Error: {str(e)}")


def main():
    global file_prefix_path
    # Check if the file prefix path is provided
    if len(sys.argv) != 2:
        program_name = sys.argv[0]
        print(f"Usage: python {program_name} <file_prefix_path>")
        print(f"Using default file prefix path: {file_prefix_path}")
    else:
        file_prefix_path = sys.argv[1]
    
    try:
        # Establish database connection
        conn = get_connection()
        if conn is None:
            raise Exception("Database connection is not established")
        
        column_names_area_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table('area_type', column_names_area_type)
        
        column_names_artist_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table('artist_type', column_names_artist_type)
        
        column_names_event_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table('event_type', column_names_event_type)
        
        column_names_instrument_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table('instrument_type', column_names_instrument_type)
        
        column_names_gender = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table('gender', column_names_gender)
        
        column_names_genre = ["id", "gid", "name", "comment", "edits_pending", "last_updated"]
        import_csv_to_table('genre', column_names_genre, 4)
        
        column_names_area = [
            "id", "gid", "name", "type", "edits_pending", "last_updated",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "ended", "comment"
        ]
        import_csv_to_table('area', column_names_area, 6)
        
        column_names_artist = [
            "id", "gid", "name", "sort_name",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "type", "area", "gender", "comment", "edits_pending",
            "last_updated", "ended", "begin_area", "end_area"
        ]
        import_csv_to_table('artist', column_names_artist, 12)
        
        column_names_event = [
            "id", "gid", "name",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "time", "type", "cancelled", "setlist",
            "comment", "edits_pending", "last_updated", "ended"
        ]
        import_csv_to_table('event', column_names_event, 8)
        
        column_names_instrument = [
            "id", "gid", "name", "type",
            "edits_pending", "last_updated", "comment", "description"
        ]
        import_csv_to_table('instrument', column_names_instrument, 2)

        column_names_link_type = [
            "id", "parent", "child_order", "gid", "entity_type0", 
            "entity_type1", "name", "description", "link_phrase", 
            "reverse_link_phrase", "long_link_phrase", "last_updated", 
            "is_deprecated", "has_dates", "entity0_cardinality", 
            "entity1_cardinality"
        ]
        import_csv_to_table('link_type', column_names_link_type, 1, parent_id_index=1)

        column_names_link = [
            "id", "link_type", "begin_date_year", "begin_date_month", 
            "begin_date_day", "end_date_year", "end_date_month", 
            "end_date_day", "attribute_count", "created", "ended"
        ]
        import_csv_to_table('link', column_names_link, 12)

        column_names_l_artist_event = [
            "id", "link", "entity0", "entity1", "edits_pending", 
            "last_updated", "link_order", "entity0_credit", 
            "entity1_credit"
        ]
        import_csv_to_table('l_artist_event', column_names_l_artist_event, 8)

        column_names_l_artist_genre = [
            "id", "link", "entity0", "entity1", "edits_pending", 
            "last_updated", "link_order", "entity0_credit", 
            "entity1_credit"
        ]
        import_csv_to_table('l_artist_genre', column_names_l_artist_genre, 2)

        column_names_l_artist_instrument = [
            "id", "link", "entity0", "entity1", "edits_pending", 
            "last_updated", "link_order", "entity0_credit", 
            "entity1_credit"
        ]
        import_csv_to_table('l_artist_instrument', column_names_l_artist_instrument, 2)

    except Exception as e:
        print(f"Error: {str(e)}")

    finally:
        # Close the database connection
        if conn is not None:
            conn.close()


if __name__ == '__main__':
    main()
