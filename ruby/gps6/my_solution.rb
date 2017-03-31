# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative calls for a file within the same directory
# require simply calls for something, and require_relative is a subclass of require
require_relative 'state_data'

class VirusPredictor

  # This method creates a new instance of the class with passed in parameters
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # This method runs the predicted deaths and the speed of spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # This method prints the amount of deaths predicted, depending on the population density
  def predicted_deaths
    num = case @population_density
    when 200..99999 then 0.4
    when 150...200 then 0.3
    when 100...150 then 0.2
    when 50...100 then 0.1
    when 0...50 then 0.05
    end
    number_of_deaths = (@population * num).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  # This method prints how fast a spread will occur depending on the population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = case @population_density
    when 200..99999 then 0.5
    when 150...200 then 1
    when 100...150 then 1.5
    when 50...100 then 2
    when 0...50 then 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


STATE_DATA.each do |state, density_population|
  predicted_state = VirusPredictor.new(state, density_population[:population_density], density_population[:population])
  predicted_state.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

#=======================================================================
# Reflection Section
=begin
  
What are the differences between the two different hash syntaxes shown in the state_data file?
  For one of the hashes, the key is a string, and the other syntax the key is a symbol

What does require_relative do? How is it different from require?
  require_relative calls for a file within the same directory.  require simply calls for something, and require_relative is a subclass of require

What are some ways to iterate through a hash?
  a way iterate through a hash is to use .each with a block |key, value|

When refactoring virus_effects, what stood out to you about the variables, if anything?
  the thing that stood out to me was that it was taking in parameters that were already accessible, and the arguments were actually never being used

What concept did you most solidify in this challenge?
  refactoring and using a case statemtent were solidified in this challenge

=end