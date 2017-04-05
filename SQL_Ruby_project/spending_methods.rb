

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
end

def current_bal(db, name)
	money_data = db.execute("SELECT current_balance FROM users WHERE username=?", [name])
	balance = data_to_money(money_data)
end

def add_transaction(db, name, amount, is_income)
	current_balance = current_bal(db, name)
	if is_income
		new_balance = current_balance + amount
	else
		new_balance = current_balance - amount
	end
	money_data = money_to_data(new_balance)
	db.execute("UPDATE users SET current_balance=? WHERE username=?", [money_data, name])
	new_balance
end

NEGATIVE = -1
def record_transaction(db, name, amount, source, time, is_income)
	id = find_user_id(db, name)
	if !is_income
		amount *= NEGATIVE
	end
	money_data = money_to_data(amount)
	time = date_time_conversion(time.to_s)
	db.execute("INSERT INTO transactions (time_stamp, amount, category, user_id) VALUES (?,?,?,?)", [time, money_data, source, id])
end

def find_user_id(db, name)
	data = db.execute("SELECT id FROM users WHERE username=?", [name])
	id = data[0][0]
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
def format_date(date)
	formatted_date = [date[MONTH], date[DAY], date[YEAR]].join("/")
end

HOUR = 0
MINUTE = 1
# Military time pronounciation
TWELVE_HOUR_CONVERSION = 12
ZERO_HUNDRED = 0
ELEVEN_HUNDRED = 11
TWELVE_HUNDRED = 12
def format_time(time)
	am_pm = "AM"
	hour = time[HOUR].to_i
	if hour == ZERO_HUNDRED
		hour = TWELVE_HOUR_CONVERSION
	elsif hour > ELEVEN_HUNDRED
		if hour > TWELVE_HUNDRED
			hour -= TWELVE_HOUR_CONVERSION
		end
		am_pm = "PM"
	end
	formatted_time = [hour.to_s, time[MINUTE]].join(":") + am_pm
end

START = 0
DATE_INDEX = 1
AMOUNT_INDEX = 2
CATEGORY_INDEX = 3
ALL = -1
def print_transactions(db, name, number_of_transactions)
	id = find_user_id(db, name)
	transactions = db.execute("SELECT * FROM transactions WHERE user_id=?",[id])
	limit = ALL
	if number_of_transactions.to_i < transactions.length
		limit += number_of_transactions
	end
	transactions.reverse[START..limit].each do |transaction|
		date = transaction[DATE_INDEX]
		amount = data_to_money(transaction[AMOUNT_INDEX]).to_s
		amount = format_money(amount)
		category = transaction[CATEGORY_INDEX]
		puts amount.to_s + " " + category + " on " + date
	end
end

CENTS = 1
ONE = 1
def format_money(money)
	money = money.split(".")
	if money[CENTS].size == ONE
		money[CENTS] += "0"
	end
	formatted_money = "$" + money.join(".")
end

def spacing
	puts ""
	puts "____________________________"
	puts ""
end