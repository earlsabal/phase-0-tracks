class Santa
	attr_reader :ethnicity, :reindeer_ranking
	attr_accessor :gender, :age

	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}"
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer_name)
		reindeer_index = @reindeer_ranking.index(reindeer_name)
		@reindeer_ranking.delete_at(reindeer_index)
		@reindeer_ranking << reindeer_name
	end
end
=begin
santa = Santa.new
santa.speak
santa.eat_milk_and_cookies("chocolate chip cookie")
=end

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
for number_of_santas in 0..50
	santas << Santa.new(example_genders.sample, example_ethnicities.sample)
end


santas.each do |santa|
	santa.age = Random.rand(140)
	puts "This santa is #{santa.age} years old, #{santa.ethnicity} and a #{santa.gender}"
end

p santas.last.reindeer_ranking 
santas.last.get_mad_at("Dasher")
p santas.last.reindeer_ranking