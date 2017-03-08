def new_employee()
	puts "What is your name?"
	employee_name = gets.chomp() 
	puts "How old are you?"
	employee_age = gets.to_s.chomp() 
	puts "What year were you born?"
	employee_year_of_birth = gets.to_s.chomp() 
	puts "Our company cafeteria serves garlic bread. Should we order some for you?"
	employee_bread = gets.chomp()
	puts "Would you like to enroll in the company’s health insurance?"
	health_insurance = gets.chomp() 
end