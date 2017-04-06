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
		if user_name == "exit"
			puts "exit is an unavailable username, please try another"
		elsif !existing_name_checker(db, user_name)
			valid_name = true
		else
			puts "Username is taken, please try another"
		end
	end
	puts "What is your current balance?"
	valid_entry = false
	while !valid_entry
		balance = gets.chomp
		if valid_balance(balance)
			valid_entry = true
		else
			puts "Not a valid entry, please try again"
		end
	end
	balance = balance.to_f
	converted_balance = money_to_data(balance)
	add_user(db, user_name, converted_balance)
else
	puts "What is your username? (Or type exit to close program)"
	valid_name = false
	while valid_name == false
		user_name = gets.chomp
		if user_name == "exit"
			valid_name = true
			puts "Closing program..."
		elsif !existing_name_checker(db, user_name)
			puts "That username does not exist, please try again or type exit"
		else
			valid_name = true
		end
	end
end

spacing

if user_name != "exit"
	puts "Welcome #{user_name}!"
	desired_task = 0
	while desired_task != 9
		puts "What would you like to do today? (Enter number)"
		puts "1: See current balance"
		puts "2: Enter income"
		puts "3: Enter expense"
		puts "4: See transactions"
		puts "9: Exit program"
		desired_task = gets.to_i
		if desired_task == 1
			puts "Here is your current balance:"
			puts current_bal(db, user_name)
		elsif desired_task == 2
			puts "How much is the income? (Type amount or type back)"
			income = 0.0
			while income == 0.0
				income = gets.chomp
				if income == "back"
					puts "Going back..."
				else
					income = income.to_f
					if income == 0.0  || !valid_money_entry(income)
						puts "Not a valid entry, please try again"
						income = 0.0
					end
				end
			end
			if income != "back"
				puts "How did you get this income?"
				source = gets.chomp
				time = Time.now
				record_transaction(db, user_name, income, source, time, true)
				puts "Here is your new current balance:"
				puts add_transaction(db, user_name, income, true)
			end
		elsif desired_task == 3
			puts "How much is the expense? (Type amount or type back)"
			expense = 0.0
			while expense == 0.0
				expense = gets.chomp
				if expense == "back"
					puts "Going back..."
				else
					expense = expense.to_f
					if expense == 0.0 || !valid_money_entry(expense)
						puts "Not a valid entry, please try again"
						expense = 0.0
					end
				end
			end
			if expense != "back"
				puts "Where did your expense go to?"
				source = gets.chomp
				time = Time.now
				record_transaction(db, user_name, expense, source, time, false)
				puts "Here is your new current balance:"
				puts add_transaction(db, user_name, expense, false)
			end
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
end
puts "Thank you for using the spending app!"