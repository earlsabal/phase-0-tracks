puts "What is the hamster's name?"
hamster_name = gets.chomp 
puts "What is the hamster's volume?"
volume = gets.to_i
puts "What is the hamster's fur color?"
color = gets.chomp()
adoption = ""
while (adoption != "Y") && (adoption != "N")
	puts "Is the hamster a good candidate for adoption? (Y/N)"
	adoption = gets.chomp.upcase
end
adoption = (adoption == "Y") 
puts "What is the hamster's estimated age?"
age = gets.to_i
age = nil if age == ""

puts "The hamster is named " + hamster_name + "."
puts "The hamster's volume is " + volume.to_s + "."
puts "The hamster's fur color is " + color + "."
puts "The hamster is a good candidate for adoption" if adoption == true
puts "The hamster is not a good candidate for adoption" if adoption == false
puts "The hamster's estimated age is unknown" if age == nil
puts "The hamster's estimated age is " + age.to_s + "." if age != nil 
