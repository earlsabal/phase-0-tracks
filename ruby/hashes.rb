=begin
- Greet the user
- Ask for the client's name
- Ask for the client's age
- Ask for the number of children
- Ask for the decor theme
- Ask if there are pets
- Print the information received
- Ask if there are any mistakes
- If user says yes, allow to fix that specific mistake
- Print the final information
=end

def generate_client_information
	client_information = {}
	puts "Hello!"
	puts "What is the client's name?"
	client_information[:name] = gets.chomp
	puts "What is the client's age?"
	client_information[:age] = gets.to_i
	puts "How many children does the client have?"
	client_information[:number_of_children] = gets.to_i
	puts "Does the client have any pets?"
	client_information[:has_pets] = gets.chomp
	puts "What is the desired decor theme?"
	client_information[:decor_theme] = gets.chomp

	return client_information
end

puts generate_client_information