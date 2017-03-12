=begin
- Greet the user
- Ask for the client's name
- Ask for the client's age
- Ask for the number of children
- Ask for the decor theme
- Ask if there are pets
- Print the information received
- Ask if user wants to make any changes
- If user says yes, allow to fix that specific mistake
- Print the final information
=end

def generate_client_information
	client_information = {}
	puts "Hello!"
	client_information[:name] = get_name
	client_information[:age] = get_age
	client_information[:number_of_children] = get_number_of_children
	client_information[:has_pets] = get_has_pets
	client_information[:decor_theme] = get_decor_theme

	list_of_information = generate_list_of_information(client_information)
	puts list_of_information
	is_correct = ""
	while is_correct.downcase != "no"
		puts "Would you like to make any changes?"
		is_correct = gets.chomp
		if is_correct.downcase == "yes"
			puts "What would you like to change?"
			information_to_change = gets.chomp
			if information_to_change.downcase == "name"
				client_information[:name] = get_name
			elsif information_to_change.downcase == "age"
				client_information[:age] = get_age
			elsif information_to_change.downcase == "number of children"
				client_information[:number_of_children] = get_number_of_children
			elsif information_to_change.downcase == "pets"
				client_information[:has_pets] = get_has_pets
			elsif information_to_change.downcase == "decor theme"
				client_information[:decor_theme] = get_decor_theme
			end
		end
		list_of_information = generate_list_of_information(client_information)
	end
	list_of_information
end

def generate_list_of_information(information)
	list = []
	list << "Name: " + information[:name]
	list << "Age: " + information[:age].to_s
	list << "Number of Children: " + information[:number_of_children].to_s
	list << "Pets: " + information[:has_pets].to_s
	list << "Decor Theme: " + information[:decor_theme]
	list
end

def get_name
	puts "What is the client's name?"
	name = gets.chomp
	name
end

def get_age
	puts "What is the client's age?"
	age = gets.to_i
	age
end

def get_number_of_children
	puts "How many children does the client have?"
	number_of_children = gets.to_i
	number_of_children
end

def get_has_pets
	puts "Does the client have any pets?"
	has_pets = gets.chomp
	return has_pets.downcase == "yes"
end

def get_decor_theme
	puts "What is the desired decor theme?"
	decor_theme = gets.chomp
	decor_theme
end

puts generate_client_information