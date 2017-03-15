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
	letters_in_name = initial_name.downcase.split("")
	counter = 0
	letters_in_name.each do |letter|
		letters_in_name[counter] = change_letter(letter)
		counter += 1
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
		current_vowels_index = VOWELS.index(letter)
		new_letter = VOWELS[current_vowels_index + 1]
	end
	new_letter
end

puts generate_spy_name("Earl Sabal")