import sqlite3
import os

TABLES = ["quests", "characters", "blog"]

def save_image(image_data, path):
    try:
        with open(path, 'wb') as img_file:
            img_file.write(image_data)
    except Exception as e:
        print(f"Failed to save image {path}: {e}")

def main():
    conn = sqlite3.connect("chimgio.db")
    cursor = conn.cursor()
    conn.text_factory = bytes
    print("Successfully connected to DB\n")
    for item in TABLES:
        print(f"Processing table: {item}")
        path = os.path.join(os.getcwd(), item)
        if not os.path.exists(path):
            os.mkdir(path)
        try:
            query = f"SELECT id, image FROM {item}"
            cursor.execute(query)
            results = cursor.fetchall()
            for row in results:
                tmp_id = row[0]
                tmp_image = row[1]
                if tmp_image:
                    save_image(tmp_image, os.path.join(path, f"{tmp_id}.png"))
            if not results:
                print(f"No records found in table {item}.")
        except sqlite3.Error as e:
            print(f"The following error happened: {e}")
        else:
            pass
    conn.close()


if __name__ == "__main__":
    main()