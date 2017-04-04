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
		if !existing_name_checker(db, user_name)
			valid_name = true
		else
			p "Username is taken, please try another"
		end
	end
	p "What is your current balance? $$$"
	balance = gets.to_f
	converted_balance = money_to_data(balance)
	add_user(db, user_name, converted_balance)
else
	p "What is your username?"
	valid_name = false
	while valid_name == false
		user_name = gets.chomp
		if !existing_name_checker(db, user_name)
			"That username does not exist, please try again"
		else
			valid_name = true
		end
	end
end

desired_task = 0
while desired_task != 9
	p "What would you like to do today? Enter number"
	p "1: See current balance"
	p "2: Enter income"
	p "3: Enter expense"
	p "4: See transactions"
	p "9: Exit program"
	desired_task = gets.to_i
	if desired_task == 1
		p "Here is your current balance:"
		p "$" + current_bal(db, user_name).to_s
	elsif desired_task == 2
		p "Here is your new current balance:"
	elsif desired_task == 3
		p "Here is your new current balance:"
	elsif desired_task == 4
		p "Here are your transactions:"
	elsif desired_task == 9
		p "Exiting..."
	else
		p "Not a valid entry, please try again"
	end
end
p "Thank you for using the spending app!"
		




# Program can take an income and add it to the current balance
# Program can take an expense and subtract it to the current balance
# Program can record a transaction and store it
# Program can print all transactions, or requested number of transactions