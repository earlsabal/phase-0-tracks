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