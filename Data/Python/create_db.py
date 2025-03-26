import sqlite3

# Connect to or create the database
conn = sqlite3.connect("AutoTest.db")
cursor = conn.cursor()

# Create the user table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS user (
        Name TEXT NOT NULL,
        Surname TEXT NOT NULL,
        Email TEXT UNIQUE NOT NULL
    )
''')

# Simulate a stored procedure by defining a function to insert data
def insert_user(name, surname, email):
    try:
        cursor.execute('''
            INSERT INTO user (Name, Surname, Email)
            VALUES (?, ?, ?)
        ''', (name, surname, email))
        conn.commit()
        print(f"Inserted: {name} {surname} - {email}")
    except sqlite3.IntegrityError:
        print(f"Email {email} already exists!")

# Insert sample data
insert_user("John", "Doe", "john.doe@example.com")
insert_user("Jane", "Smith", "jane.smith@example.com")
insert_user("Bob", "Johnson", "bob.johnson@example.com")

# Close the connection
conn.close()