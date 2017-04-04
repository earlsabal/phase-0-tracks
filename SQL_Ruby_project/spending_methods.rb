INCLUDED = [[1]]

def valid_name_checker(db, name)
	if db.execute("SELECT 1 FROM spending WHERE username=?", [name]) == INCLUDED
		false
	else
		true
	end
end