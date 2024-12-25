import sqlite3 from "sqlite3";

// Create a new SQLite database in memory (or use a file like './test.db')
const db = new sqlite3.Database("./test.db");

// Create a table if it doesn't exist
db.run(
  "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)",
  (err) => {
    if (err) {
      console.error("Error creating table:", err);
    }
  },
);

// Insert data into the table
const stmt = db.prepare("INSERT INTO users (name) VALUES (?)");
stmt.run("Alice", (err) => {
  if (err) {
    console.error("Error inserting data:", err);
  }
});

// Query data from the table
db.all("SELECT id, name FROM users", [], (err, rows) => {
  if (err) {
    console.error("Error querying data:", err);
  }
  // Output the results
  rows.forEach((row) => {
    console.log(`User: ${row.id}, Name: ${row.name}`);
  });
});

// Close the database
db.close((err) => {
  if (err) {
    console.error("Error closing the database:", err);
  }
});
