# Create database with table
require 'sqlite3'
require_relative 'spending_methods'

db = SQLite3::Database.new("spending.db")

create_users_table = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    username VARCHAR(255),
    current_balance INT
  )
SQL

create_transactions_table = <<-SQL
	CREATE TABLE IF NOT EXISTS transactions(
		id INTEGER PRIMARY KEY,
		day VARCHAR(255),
		change INT,
		category VARCHAR(255),
		user_id INT,
		FOREIGN KEY (user_id) REFERENCES users(id)
		)
SQL

db.execute(create_users_table)
db.execute(create_transactions_table)
=begin
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
		p "How much is the income?"
		income = gets.to_f
		p "How did you get this income?"
		source = gets.chomp
		time = Time.now
		add_transaction(db, user_name, income, source, time, true)
		p "Here is your new current balance:"
		p add_income(db, user_name, income)
	elsif desired_task == 3
		p "How much is the expense?"
		expense = gets.to_f
		p "Where did your expense go to?"
		source = gets.chomp
		time = Time.now
		add_transaction(db, user_name, expense, source, time, false)
		p "Here is your new current balance:"
		p add_expense(db, user_name, expense)
	elsif desired_task == 4
		p "Here are your transactions:"
	elsif desired_task == 9
		p "Exiting..."
	else
		p "Not a valid entry, please try again"
	end
end
p "Thank you for using the spending app!"
=end
# Program can record a transaction and store it
# Program can print all transactions, or requested number of transactions

time = '2009-06-24 12:39:54 +0900'
p date_time_conversion(time)
time = '2009-04-30 00:39:54 +0900'
p date_time_conversion(time)
time = '2009-07-02 13:39:54 +0900'
p date_time_conversion(time)
time = '2009-12-25 11:39:54 +0900'
p date_time_conversion(time)
time = '2009-12-25 01:39:54 +0900'
p date_time_conversion(time)