INCLUDED = [[1]]

def existing_name_checker(db, name)
	if db.execute("SELECT 1 FROM spending WHERE username=?", [name]) == INCLUDED
		true
	else
		false
	end
end

def add_user(db, name, balance)
	db.execute("INSERT INTO spending (username, current_balance) VALUES (?, ?)", [name, balance])
end

def money_to_data(initial)
	final = initial * 100
	final.to_i
end

def data_to_money(initial)
	final = initial[0][0].to_f / 100
end

def current_bal(db, name)
	data = db.execute("SELECT current_balance FROM spending WHERE username=?", [name])
	balance = data_to_money(data)
end