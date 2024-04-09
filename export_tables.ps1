# Set the path to your SQLite database file
$DB_FILE = "C:/Users/YOUSSEFKAWOOK/Desktop/CTA/SQL/football_teams_database"

# Get list of tables in the database
$Tables = & 'C:\Users\YOUSSEFKAWOOK\Desktop\CTA\SQL\sqlite3.exe'  $DB_FILE ".tables"

# Export each table to a CSV file
foreach ($Table in $Tables) {
    # Remove any leading and trailing whitespace from the table name
    $Table = $Table.Trim()

    # Export the table to a CSV file
    & 'C:\Users\YOUSSEFKAWOOK\Desktop\CTA\SQL\sqlite3.exe'  -header -csv $DB_FILE "SELECT * FROM $Table;" | Out-File -FilePath "$Table.csv" -Encoding utf8
}

