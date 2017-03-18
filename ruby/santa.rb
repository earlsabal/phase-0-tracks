class Santa
	attr_reader :age, :ethnicity
	attr_accessor :gender

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
		reindeer_index = @reindeer_ranking[reindeer_name].index
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

age = 1
santas.each do |santa|
	celebrations = 0
	while celebrations < age
		santa.celebrate_birthday
		celebrations += 1
	end
	puts "This santa is #{santa.age} years old and #{santa.ethnicity}"
	age +=1
end
p santas.last.gender
santas.last.gender = example_genders[0]
p santas.last.gender