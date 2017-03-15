=begin
- takes first and last name and separate them into two different strings
- turn strings into arrays of letters
- starting from the first letter, change current letter to the next letter in alphabet
	- if consonant, change to next consonant
	- if vowel, change to next vowel
- create a new string for new name
- join the two arrays into two strings
- insert the changed last name first into the new string
- insert the changed first name into the new string
- print new name
=end

def generate_spy_name(full_name)
	names = full_name.split(" ")
	counter = 0
	names.each do |name|
		names[counter] = create_new_name(name)
		counter += 1
	end
	names
end

def create_new_name(initial_name)
	new_name = "hello"
end

puts generate_spy_name("Earl Sabal")