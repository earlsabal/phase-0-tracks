# Create database with table
require 'sqlite3'
require_relative 'spending_methods'

db = SQLite3::Database.new("spending.db")

create_spending_table = <<-SQL
  CREATE TABLE IF NOT EXISTS spending(
    id INTEGER PRIMARY KEY,
    username VARCHAR(255),
    current_balance INT
  )
SQL

db.execute(create_spending_table)
p db.execute("SELECT * FROM spending")

# Program can create a new user with current balance

p "Hello! Welcome to the spending app, where we keep track of your money!"
has_an_account = ""
while has_an_account != "yes" && has_an_account != "no"
	p "Do you have an account with us? (Answer: yes or no)"
	has_an_account = gets.chomp.downcase
end
if has_an_account == "no"
	p "What would you like your username to be?"
	valid_name = false
	while valid_name == false
		user_name = gets.chomp
		if valid_name_checker(db, user_name)
			valid_name = true
		else
			p "Username is taken, please try another"
		end
	end
	p "What is your current balance? $$$"
	balance = gets.to_f
	converted_balance = money_to_data(balance)
	add_user(db, user_name, converted_balance)
end


# Program can check for an existing user using username and pin
# Program can take an income and add it to the current balance
# Program can take an expense and subtract it to the current balance
# Program can record a transaction and store it
# Program can print all transactions, or requested number of transactions