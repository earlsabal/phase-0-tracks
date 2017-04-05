# Create database with table
require 'sqlite3'
require_relative 'spending_methods'

db = start_database

puts "Hello! Welcome to the spending app, where we keep track of your money!"

has_an_account = ""
while has_an_account != "yes" && has_an_account != "no"
	puts "Do you have an account with us? (Answer: yes or no)"
	has_an_account = gets.chomp.downcase
end

spacing

if has_an_account == "no"
	puts "What would you like your username to be?"
	valid_name = false
	while valid_name == false
		user_name = gets.chomp
		if !existing_name_checker(db, user_name)
			valid_name = true
		else
			puts "Username is taken, please try another"
		end
	end
	puts "What is your current balance? $$$"
	balance = gets.to_f
	converted_balance = money_to_data(balance)
	add_user(db, user_name, converted_balance)
else
	puts "What is your username?"
	valid_name = false
	while valid_name == false
		user_name = gets.chomp
		if !existing_name_checker(db, user_name)
			puts "That username does not exist, please try again"
		else
			valid_name = true
		end
	end
end

spacing

puts "Welcome #{user_name}!"
desired_task = 0
while desired_task != 9
	puts "What would you like to do today? Enter number"
	puts "1: See current balance"
	puts "2: Enter income"
	puts "3: Enter expense"
	puts "4: See transactions"
	puts "9: Exit program"
	desired_task = gets.to_i
	if desired_task == 1
		puts "Here is your current balance:"
		puts format_money(current_bal(db, user_name).to_s)
	elsif desired_task == 2
		puts "How much is the income?"
		income = gets.to_f
		puts "How did you get this income?"
		source = gets.chomp
		time = Time.now
		record_transaction(db, user_name, income, source, time, true)
		puts "Here is your new current balance:"
		puts add_transaction(db, user_name, income, true)
	elsif desired_task == 3
		puts "How much is the expense?"
		expense = gets.to_f
		puts "Where did your expense go to?"
		source = gets.chomp
		time = Time.now
		record_transaction(db, user_name, expense, source, time, false)
		puts "Here is your new current balance:"
		puts add_transaction(db, user_name, expense, false)
	elsif desired_task == 4
		puts "How many transactions would you like to view? (Type a number ex: 1, 2, 3 or type 0 for all)"
		number = gets.to_i
		puts "Here are your transactions:"
		print_transactions(db, user_name, number)
	elsif desired_task == 9
		puts "Exiting..."
	else
		puts "Not a valid entry, please try again"
	end
	spacing
end
puts "Thank you for using the spending app!"

# Program can print all transactions, or requested number of transactions
