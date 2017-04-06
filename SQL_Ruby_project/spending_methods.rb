CENTS = 1
ONE = 1
TWO = 2
INCLUDED = [[1]]
CONVERSION = 100
NEGATIVE = -1
START = 0

def start_database
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
			time_stamp VARCHAR(255),
			amount INT,
			category VARCHAR(255),
			user_id INT,
			FOREIGN KEY (user_id) REFERENCES users(id)
			)
	SQL
	db.execute(create_users_table)
	db.execute(create_transactions_table)
	db
end

def existing_name_checker(db, name)
	if db.execute("SELECT 1 FROM users WHERE username=?", [name]) == INCLUDED
		true
	else
		false
	end
end

def add_user(db, name, balance)
	db.execute("INSERT INTO users (username, current_balance) VALUES (?, ?)", [name, balance])
end

def money_to_data(money)
	money_data = money * CONVERSION
	money_data.to_i
end

def data_to_money(data)
	if data.is_a? Integer
		money = data.to_f / CONVERSION
	else
		money = data[0][0].to_f / CONVERSION
	end
	format_money(money)
end

def current_bal(db, name)
	money_data = db.execute("SELECT current_balance FROM users WHERE username=?", [name])
	balance = data_to_money(money_data)
end

def add_transaction(db, name, amount, is_income)
	current_balance = current_bal(db, name).delete("$").to_f
	if is_income
		new_balance = current_balance + amount
	else
		new_balance = current_balance - amount
	end
	money_data = money_to_data(new_balance)
	db.execute("UPDATE users SET current_balance=? WHERE username=?", [money_data, name])
	format_money(new_balance)
end

def record_transaction(db, name, amount, source, time, is_income)
	id = find_user_id(db, name)
	if !is_income
		amount *= NEGATIVE
	end
	money_data = money_to_data(amount)
	time = date_time_conversion(time)
	db.execute("INSERT INTO transactions (time_stamp, amount, category, user_id) VALUES (?,?,?,?)", [time, money_data, source, id])
end

def find_user_id(db, name)
	data = db.execute("SELECT id FROM users WHERE username=?", [name])
	id = data[0][0]
end

def date_time_conversion(data)
	formatted_time = data.strftime "%m/%d/%y %I:%M%p"
end

def print_transactions(db, name, number_of_transactions)
	date_index = 1
	amount_index = 2
	category_index = 3
	all = -1
	id = find_user_id(db, name)
	transactions = db.execute("SELECT * FROM transactions WHERE user_id=?",[id])
	limit = all
	if number_of_transactions.to_i < transactions.length
		limit += number_of_transactions
	end
	transactions.reverse[START..limit].each do |transaction|
		date = transaction[date_index]
		amount = data_to_money(transaction[amount_index])
		category = transaction[category_index]
		puts amount.to_s + " " + category + " on " + date
	end
end

def format_money(money)
	money = dollar_cent_split(money)
	if money[CENTS].size == ONE
		money[CENTS] += "0"
	end
	formatted_money = "$" + money.join(".")
end

def valid_money_entry(money)
	money = dollar_cent_split(money)
	if money[CENTS].size > TWO
		false
	else
		true
	end
end

def valid_balance(entry)
	valid_characters = "1234567890."
	entry.split("").each do |character|
		if !valid_characters.include?(character)
			return false
		end
	end
	valid_money_entry(entry.to_f)
end

def dollar_cent_split(money)
	split_money = money.to_s.split(".")
end

def spacing
	puts ""
	puts "____________________________"
	puts ""
end