import csv
import os
import psycopg2
import sys
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Default file prefix path
file_prefix_path = os.path.join('mbdump', 'mbdump')

def import_csv_to_table(conn, table_name, column_names):
    global file_prefix_path
    if conn is None:
        raise Exception("Database connection is not established")
    
    file_path = os.path.join(file_prefix_path, table_name)
    inserted_rows = 0
    skipped_rows = 0

    try:
        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            reader = csv.reader(f, delimiter='\t')
            
            total_lines = sum(1 for _ in open(file_path, 'r', encoding='utf-8', errors='replace'))
            # Reset file pointer
            f.seek(0)

            query = f"INSERT INTO {table_name} ({', '.join(column_names)}) VALUES ({', '.join(['%s'] * len(column_names))})"
            cursor = conn.cursor()

            print(f"Preparing to insert {total_lines} rows into {table_name} table using query: {query}")

            for row in reader:
                try:
                    # Handle NULL values
                    row = [None if value == '\\N' else value for value in row]
                    cursor.execute(query, row)
                    inserted_rows += 1
                except Exception as row_error:
                    print(f"\nError on line {reader.line_num}: {str(row_error)}")
                    with open('error_rows.log', 'a', encoding='utf-8') as error_log:
                        error_log.write(f"Error on line {reader.line_num}: {row}\n")
                    skipped_rows += 1
                    
                print(f"\r{reader.line_num}/{total_lines} ({(reader.line_num/total_lines)*100:.2f}%)", end='')

        conn.commit()
        print(f"\n\tInserted {inserted_rows} rows into {table_name} successfully, skipped {skipped_rows} rows")

    except Exception as e:
        print(f"Error: {str(e)}")
        conn.rollback()

    finally:
        if cursor: cursor.close()


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
        conn = psycopg2.connect(
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            host=os.getenv('DB_HOST'),
            port=os.getenv('DB_PORT'),
            database=os.getenv('DB_NAME')
        )

        column_names_area_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table(conn, 'area_type', column_names_area_type)
        
        column_names_area = [
            "id", "gid", "name", "type", "edits_pending", "last_updated",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "ended", "comment"
        ]
        import_csv_to_table(conn, 'area', column_names_area)
        
        column_names_artist = [
            "id", "gid", "name", "sort_name",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "type", "area", "gender", "comment", "edits_pending",
            "last_updated", "ended", "begin_area", "end_area"
        ]
        import_csv_to_table(conn, 'artist', column_names_artist)
        
        column_names_artist_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table(conn, 'artist_type', column_names_artist_type)
        
        column_names_event_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table(conn, 'event_type', column_names_event_type)
        
        column_names_event = [
            "id", "gid", "name",
            "begin_date_year", "begin_date_month", "begin_date_day",
            "end_date_year", "end_date_month", "end_date_day",
            "time", "type", "cancelled", "setlist",
            "comment", "edits_pending", "last_updated", "ended"
        ]
        import_csv_to_table(conn, 'event', column_names_event)
        
        column_names_gender = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table(conn, 'gender', column_names_gender)
        
        column_names_genre = ["id", "gid", "name", "comment", "edits_pending", "last_updated"]
        import_csv_to_table(conn, 'genre', column_names_genre)
        
        column_names_instrument_type = ["id", "name", "parent", "child_order", "description", "gid"]
        import_csv_to_table(conn, 'instrument_type', column_names_instrument_type)
        
        column_names_instrument = [
            "id", "gid", "name", "type",
            "edits_pending", "last_updated", "comment", "description"
        ]
        import_csv_to_table(conn, 'instrument', column_names_instrument)

    except Exception as e:
        print(f"Error: {str(e)}")

    finally:
        # Close the database connection
        conn.close()


if __name__ == '__main__':
    main()
