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
	client_information = {
		puts "Hello!"
		puts "What is the client's name?"
		puts "What is the client's age?"
		puts "How many children does the client have?"
		puts "Does the client have any pets?"
		puts "What is the desired decor theme?"
	}
	return client_information
end