module Shout
=begin
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + "!!!" + " :)"
	end
=end
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yelling_happily(words)
		words + "!!!" + " :)"
	end

end

class Man
	include Shout
end

class Woman
	include Shout
end

#p Shout.yell_angrily("How could you do this")
#p Shout.yelling_happily("How did you do this")

man = Man.new
p man.yell_angrily("How could you do this?")
p man.yelling_happily("Oh wait, yeah that makes sense?")

woman = Woman.new
p woman.yelling_happily("How did you do this?")
p woman.yell_angrily("So you're telling me you didn't do this?")