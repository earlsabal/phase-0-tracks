class Puppy

  def initialize
  	puts "Initializing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number_of_woofs)
  	for woofs in 0..number_of_woofs
  		puts "Woof!"
  	end
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	d_years = human_years * 7
  	d_years
  end

end

puppy = Puppy.new
puppy.fetch("frisbee")
puppy.speak(3)
puppy.roll_over
p puppy.dog_years(5)

class Dog
	def bark
		puts "BARK!!!"
	end

	def growl
		puts "Grrrrrr!!!"
	end
end

dogs = []
while dogs.size < 50
	dogs << Dog.new
end
dogs.each do |dog|
	dog.growl
	dog.bark
end