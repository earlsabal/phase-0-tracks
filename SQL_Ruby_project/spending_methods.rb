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

def money_to_data(initial)
	final = initial * 100
	final.to_i
end

def data_to_money(initial)
	final = initial[0][0].to_f / 100
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

def add_transaction(db, name, change, source, time, is_income)
	user = find_user_id(db, name)
	if !is_income
		change *= -1
	end
	change = money_to_data(change)
	db.execute("INSERT INTO transactions (day, change, category, user_id) VALUES (?,?,?,?)", [time.to_s, change, source, user])
end