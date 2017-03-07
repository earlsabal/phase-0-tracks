def hamsters()
	puts "What is the hamster's name?"
	hamstername = gets.to_s.chomp() 
	puts "What is the hamster's volume?"
	volume = gets.to_i
	puts "What is the hamster's fur color?"
	color = gets.to_s.chomp()
	puts "Is the hamster a good candidate for adoption? (Y/N)"
	adoption = gets
	adoption = (adoption == "Y") 
	puts "What is the hamster's estimated age?"
	age = gets.to_i
	age = nil if age == ""

	puts "The hamster is named "+hamstername+"."
	puts "The hamster's volume is "+volume.to_s.chomp()+"."
	puts "The hamster's fur color is "+color+"."
	puts "The hamster is a good candidate for adoption" if adoption == true
	puts "The hamster is not a good candidate for adoption" if adoption == false
	puts "The hamster's estimated age is unknown" if age == nil
	puts "The hamster's estimated age is "+age.to_s.chomp()+"." if age != nil 
end 

hamsters()