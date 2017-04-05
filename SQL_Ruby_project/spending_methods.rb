

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
			day VARCHAR(255),
			change INT,
			category VARCHAR(255),
			user_id INT,
			FOREIGN KEY (user_id) REFERENCES users(id)
			)
	SQL
	db.execute(create_users_table)
	db.execute(create_transactions_table)
	db
end

INCLUDED = [[1]]
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

CONVERSION = 100
def money_to_data(initial)
	final = initial * CONVERSION
	final.to_i
end

def data_to_money(initial)
	if initial.is_a? Integer
		final = initial.to_f / CONVERSION
	else
		final = initial[0][0].to_f / CONVERSION
	end
end

def current_bal(db, name)
	data = db.execute("SELECT current_balance FROM users WHERE username=?", [name])
	balance = data_to_money(data)
end

def add_income(db, name, income)
	current_balance = current_bal(db, name)
	new_balance = current_balance + income
	data = money_to_data(new_balance)
	db.execute("UPDATE users SET current_balance=? WHERE username=?", [data, name])
	new_balance
end

def add_expense(db, name, expense)
	current_balance = current_bal(db, name)
	new_balance = current_balance - expense
	db.execute("UPDATE users SET current_balance=? WHERE username=?", [money_to_data(new_balance), name])
	new_balance
end

def find_user_id(db, name)
	data = db.execute("SELECT id FROM users WHERE username=?", [name])
	id = data[0][0]
end

NEGATIVE = -1
def add_transaction(db, name, change, source, time, is_income)
	user = find_user_id(db, name)
	if !is_income
		change *= NEGATIVE
	end
	change = money_to_data(change)
	time = date_time_conversion(time.to_s)
	db.execute("INSERT INTO transactions (day, change, category, user_id) VALUES (?,?,?,?)", [time, change, source, user])
end

DATE = 0
TIME = 1
def date_time_conversion(data)
	data = data.split(" ")
	date = format_date(data[DATE].split("-"))
	time = format_time(data[TIME].split(":"))
	new_data = date + " " + time
end

YEAR = 0
MONTH = 1
DAY = 2
def format_date(original_format)
	date = [original_format[MONTH], original_format[DAY], original_format[YEAR]].join("/")
end

HOUR = 0
MINUTE = 1
# Military time pronounciation
TWELVE_HOUR_CONVERSION = 12
ZERO_HUNDRED = 0
ELEVEN_HUNDRED = 11
TWELVE_HUNDRED = 12
def format_time(original_format)
	am_pm = "AM"
	hour = original_format[HOUR].to_i
	if hour == TWELVE_HOUR_HUNDRED
		hour = TWELVE_HOUR_CONVERSION
	elsif hour > ELEVEN_HUNDRED
		if hour > TWELVE_HUNDRED
			hour -= TIME_CONVERSION
		end
		am_pm = "PM"
	end
	time = [hour.to_s, original_format[MINUTE]].join(":") + am_pm
end

START = 0
DATE_INDEX = 1
AMOUNT = 2
CATEGORY = 3
def print_transactions(db, name, number_of_transactions)
	user = find_user_id(db, name)
	transactions = db.execute("SELECT * FROM transactions WHERE user_id=?",[user])
	if number_of_transactions.to_i >= transactions.length
		limit = transactions.length
	else
		limit = number_of_transactions
	end
	transactions.reverse[START...limit].each do |transaction|
		date = transaction[DATE_INDEX]
		amount = data_to_money(transaction[AMOUNT])
		amount = format_money(amount.to_s)
		category = transaction[CATEGORY]
		puts amount.to_s + " " + category + " on " + date
	end
end

CENTS
ONE = 1
def format_money(initial)
	initial = initial.split(".")
	if initial[CENTS].size == ONE
		initial[CENTS] += "0"
	end
	final = "$" + initial.join(".")
end

def spacing
	puts ""
	puts "____________________________"
	puts ""
end