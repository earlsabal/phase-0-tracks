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

VOWELS = ["a", "e", "i", "o", "u"]
REAL_IDENTITY = 0
FAKE_IDENTITY = 1

def alias_manager
	real_name = ""
	list_of_aliases = []
	while real_name != "quit"
		puts 'What is your name agent? Enter "quit" if you are done'
		real_name = gets.chomp
		if real_name != "quit"
			new_alias = generate_spy_name(real_name)
			puts new_alias
			list_of_aliases << [real_name, new_alias]
		end
	end
	puts "Here are your agents"
	print_all_agents_with_aliases(list_of_aliases)
	puts "Thank you for using Alias 3000!"
end

def generate_spy_name(full_name)
	names = full_name.split(" ")
	counter = 0
	names.each do |name|
		names[counter] = create_new_name(name)
		counter += 1
	end
	spy_name = finalize_name(names)
	puts "Here is your new spy name!"
	spy_name
end

def create_new_name(initial_name)
	letters_in_name = initial_name.downcase.split("")
	index = 0
	letters_in_name.each do |letter|
		letters_in_name[index] = change_letter(letter)
		index += 1
	end
	new_name = letters_in_name.join("")
	new_name.capitalize
end

def change_letter(letter)
	unless VOWELS.include?(letter)
		if VOWELS.include?(letter.next)
			new_letter = letter.next.next
		else
			if letter == "z"
				new_letter = "b"
			else
				new_letter = letter.next
			end
		end
	else
		if letter == "u"
			new_letter = "a"
		else
			current_vowels_index = VOWELS.index(letter)
			new_letter = VOWELS[current_vowels_index + 1]
		end
	end
	new_letter
end

def finalize_name(names)
	final_name = []
	current_index = names.length - 1
	while current_index >= 0
		final_name << names[current_index]
		current_index -= 1
	end
	final_name = final_name.join(" ")
	final_name
end

def print_all_agents_with_aliases(list)
	list.each do |agent|
		puts agent[REAL_IDENTITY] + " code named " + agent[FAKE_IDENTITY]
	end
end

alias_manager