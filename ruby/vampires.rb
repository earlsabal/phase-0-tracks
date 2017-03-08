def employee_processing()
	puts "How many emplyees will be processed?"
	number_of_processes = gets
	employees_processed = 0
	while employees_processed < number_of_processes
		puts new_employee()
		employees_processed += 1
	end
	puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

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
	puts "Do you have any allergies?"
	allergy = ""
	until (allergy == "done") || (allergy == "sunshine")
		allergy = gets
	end
	
	flags_for_vampire = 0
	vampire_results = ""
	if allergy == "sunshine"
		vampire_results = "Probably a vampire"
	elsif name_checker(employee_name) == true
		vampire_results = "Definitely a vampire."
	else
		if age_checker == false
			flags_for_vampire += 1
		end
		if employee_bread == "no"
			flags_for_vampire += 1
		end
		if health_insurance == "no"
			flags_for_vampire += 1
		end

		if flags_for_vampire == 0
			vampire_results = "Results inconclusive"
		elsif flags_for_vampire == 1
			vampire_results = "Probably not a vampire"
		elsif flags_for_vampire == 2
			vampire_results = "Probably a vampire"
		elsif vampire_results == 3
			vampire_results = "Almost certainly a vampire"
		end
	end
	return vampire_results			
end

def name_checker(name)
	banned_names = ["Drake Cula", "Tu Fang"]
	if banned_names.[name] != nil
		return true
	else
		return false
	end
end

def age_checker(age, birth_year, current_year)
	expected_age = current_year - birth_year
	if age != expected_age
		if (age == expected_age - 1)
			return true
		else
			return false
		end
	end
	return true
end

employee_processing()