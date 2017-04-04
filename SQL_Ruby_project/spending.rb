# Create database with table
require 'sqlite3'

db = SQLite3::Database.new("spending.db")

create_spending_table = <<-SQL
  CREATE TABLE IF NOT EXISTS spending(
    id INTEGER PRIMARY KEY,
    username VARCHAR(255),
    pin INT,
    current_balance INT
  )
SQL

db.execute(create_spending_table)

# Program can create a new user with a pin and current balance
# Program can check for an existing user using username and pin
# Program can take an income and add it to the current balance
# Program can take an expense and subtract it to the current balance
# Program can record a transaction and store it
# Program can print all transactions, or requested number of transactions