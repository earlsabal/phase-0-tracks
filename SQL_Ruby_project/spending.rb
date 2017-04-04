require 'sqlite3'

db = SQLite3::Database.new("spending.db")

create_spending_table = <<-SQL
  CREATE TABLE IF NOT EXISTS spending(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    current_balance INT
  )
SQL

db.execute(create_spending_table)