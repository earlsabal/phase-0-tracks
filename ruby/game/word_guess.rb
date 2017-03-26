=begin
-Create a game class
-class will have 3 instance variables, two strings and an integer
	-One string will be the word to guess
	-Second string will "_" the same length as the word
	-Integer will be the number of guesses allowed in game
=end

=begin
-A method will take in a word and generate guesses
-input: string
-steps
	-Count the number of letters
	-Make sure the word is at least 3 letters
		-IF the nummber of letters is less than three
			-ask for another word
	-Generate the number of guesses allowed for the word
		-Starting with 8 guesses with 3 letters,
			add an extra guess for each additional letter
	-Create another string the same size as the word, but make each character "_"
-output: string
=end

=begin
-A method will take a guess
-input: array and string
-steps:
	-Method will take in a string
	-Make sure the string is only one character and a letter
		-IF the string does not meet requirements OR if the letter has been asked already
			-ask for another string
	-Check if the letter is in the guessing word
		-IF the letter is in the word
			-Turn the "_" in the second string to the letter guessed in the correct location
		-ELSE 
			-print that letter is not in the word
	-print how many guesses are left
-output: string
=end

#Once number of guesses are up OR the word is guessed
#IF the player wins: print "Congratulations! You won!"
#ELSE: print "HA HA HA YOUUU LOOOOSSSEEE!"
class Word_guess
	attr_reader :word, :revealed_letters, :guesses
	def initialize
		@guessed_letters = []
		@guesses = 8
	end

	def start_game(user_word)
		if valid_word(user_word) == true
			@word = user_word
			generate_guesses
			generate_revealed_letters
		else
			p "Not a valid word"
			@word = ""
		end

	end

	def valid_word(user_word)
		if user_word.length < 3
			false
		elsif user_word[/[a-zA-Z]+/] != user_word
			false
		else
			true
		end
	end

	def generate_revealed_letters
		@revealed_letters = ""
		while @revealed_letters.length < @word.length
			@revealed_letters += "_"
		end
	end

	def show_revealed_letters
		show_word = @revealed_letters.split("").join(" ")
	end

	def generate_guesses
		number_to_add = @word.length - 3
		@guesses += number_to_add
	end

	def guess(letter)
		if (letter.length > 1) || (letter[/[a-zA-Z]+/] != letter)
			p "Not a valid guess"
			false
		else
			if !@guessed_letters.include?(letter)
				@guessed_letters << letter
				@guesses -=1
				reveal_letter(letter)
			else
				p "You already guessed that letter"
				false
			end
		end
	end

	def reveal_letter(letter)
		indexes = find_indexes(letter)
		indexes.each do |index|
			@revealed_letters[index] = letter
		end
		show_revealed_letters
	end

	def find_indexes(guessed_letter)
		indexes = []
		index = 0
		@word.split("").each do |letter|
			if guessed_letter == letter
				indexes << index
			end
			index += 1
		end
		indexes
	end

	def is_game_over
		if (guesses == 0) || (@revealed_letters == @word)
			true
		else
			false
		end
	end

	def end_game_message
		winners_message = "Congratulations! You won!"
		losers_message = "HA HA HA YOUUU LOOOOSSSEEE!"
		if @revealed_letters == @word
			winners_message
		else
			losers_message
		end
	end

end

=begin
Game = Word_guess.new
p "Hello! Welcome to Word Guess!"
p "Please enter a word to guess"
user_word = ""
while valid_word(user_word) != true
	user_word = gets.chomp
end
=end