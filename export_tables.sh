#!/bin/bash

# Set the path to your SQLite database file
DB_FILE="C:/Users/YOUSSEFKAWOOK/Desktop/CTA/SQL/football_teams_database"


# List all tables in the database
TABLES=$(sqlite3 "$DB_FILE" ".tables")

# Export each table to a CSV file
for TABLE in $TABLES; do
    # Remove any leading and trailing whitespace from the table name
    TABLE=$(echo "$TABLE" | xargs)
    # Export the table to a CSV file
    sqlite3 -header -csv "$DB_FILE" "SELECT * FROM $TABLE;" > "$TABLE.csv"
done
