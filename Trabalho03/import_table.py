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


def get_connection():
    return psycopg2.connect(
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT'),
        database=os.getenv('DB_NAME')
    )


def import_csv_to_table(table_name, column_names, thread_count = 1):
    global file_prefix_path
    
    file_path = os.path.join(file_prefix_path, table_name)
    lock = threading.Lock()

    def process_chunk(thread_id, rows):
        thread_conn = get_connection()

        try:
            cursor = thread_conn.cursor()

            query = f"INSERT INTO {table_name} ({', '.join(column_names)}) VALUES %s"

            # Handle NULL values
            rows = [[None if value == '\\N' else value for value in row] for row in rows]

            execute_values(cursor, query, rows)

            thread_conn.commit()
        
            with lock:
                print(f"Thread {thread_id} completed: {len(rows)} rows processed")

        except Exception as e:
            with lock:
                print(f"Thread {thread_id} encountered an error: {str(e)}")
            thread_conn.rollback()

        finally:
            cursor.close()

    try:
        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            reader = list(csv.reader(f, delimiter='\t'))
        
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

    except Exception as e:
        print(f"Error: {str(e)}")

    finally:
        # Close the database connection
        if conn is not None:
            conn.close()


if __name__ == '__main__':
    main()
