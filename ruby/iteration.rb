NEWLINE = ""

def release_0
	puts "Release 0"
	puts NEWLINE
	strikes { |x| puts "Strike #{x+1}!" }
	spacing
end

def release_1
	days_of_the_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	ninja_turtles = {
		red: 'Raph',
		blue: 'Leo',
		purple: 'Donnie',
		orange: 'Mikey'
	}

	puts "Release 1"
	puts NEWLINE
	puts "Using the .each method:"
	puts "Prints each element in an array"
	print_elements(days_of_the_week)
	puts NEWLINE

	puts "Prints each key with element in hash"
	print_elements(ninja_turtles)
	puts NEWLINE

	puts "Using the .map!"
	puts "Initial array:"
	p days_of_the_week

	puts "Array after .map!:"
	days_of_the_week = change_days_to_numbered_days(days_of_the_week)
	p days_of_the_week

	spacing
end

def release_2
	method_1
	method_2
	method_3
	method_4
end

def method_1
	puts "Release 2"
	puts "Method 1: deletes numbers less than 5"
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	hash_of_numbers = {one: 1, two: 2, five: 5, six: 6, ten: 10}

	puts "Array---------"
	puts "Initial array:"
	p array_of_numbers
	puts "Updated array:"
	array_of_numbers.delete_if {|number| number < 5}
	p array_of_numbers
	puts NEWLINE

	puts "Hash----------"
	puts "Initial hash"
	p hash_of_numbers
	puts "Updated hash:"
	hash_of_numbers.delete_if {|key, value| value < 5 }
	p hash_of_numbers
	spacing
end

def method_2
	puts "Method 2: filters numbers less than 5"
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	hash_of_numbers = {one: 1, two: 2, five: 5, six: 6, ten: 10}

	puts "Array---------"
	puts "Initial array:"
	p array_of_numbers
	puts "Filtered array:"
	array_of_numbers.select! {|number| number < 5}
	p array_of_numbers
	puts NEWLINE

	puts "Hash----------"
	puts "Initial hash:"
	p hash_of_numbers
	puts "Filtered hash:"
	hash_of_numbers.select! {|key, value| value < 5}
	p hash_of_numbers
	spacing
end

def method_3
	puts "Method 3: filters even numbers"
	array_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	hash_of_numbers = {one: 1, two: 2, five: 5, six: 6, ten: 10}

	puts "Array---------"
	puts "Initial array:"
	p array_of_numbers
	puts "Filtered array:"
	array_of_numbers.keep_if {|number| number % 2 == 0}
	p array_of_numbers
	puts NEWLINE

	puts "Hash----------"
	puts "Initial hash:"
	p hash_of_numbers
	puts "Filtered hash:"
	hash_of_numbers.keep_if {|key, number| number % 2 == 0}
	p hash_of_numbers
	spacing
end

def method_4
	puts "Method 4: deletes numbers until condition reaches false"
	array_of_numbers = [1, 2, 3, 4, 5, 4, 3, 2, 1]
	hash_of_numbers = {one: 1, two: 2, five: 5, three: 3, ten: 10}

	puts "Array---------"
	puts "Initial array:"
	p array_of_numbers
	puts "Updated array:"
	array_of_numbers = array_of_numbers.drop_while {|number| number < 5}
	p array_of_numbers

	puts "Hash----------"
	puts "Initial hash:"
	p hash_of_numbers
	puts "Updated hash:"
	hash_of_numbers = hash_of_numbers.drop_while {|key, number| number < 5}
	p hash_of_numbers
end

def spacing
	puts NEWLINE
	puts "________________"
	puts NEWLINE
end

def strikes
	puts "That's"
	3.times {|strike_number| yield(strike_number)}
	puts "You're out!"
end

def print_elements(array_or_hash)
	if array_or_hash.is_a?(Array)
		array_or_hash.each do |day|
			puts day
		end
	elsif array_or_hash.is_a?(Hash)
		array_or_hash.each do |key, information|
			puts "#{key}: " + information
		end
	end
end

def change_days_to_numbered_days(array)
	day_number = 0
	array.map! do |day|
		day_number += 1
		"Day " + day_number.to_s
	end
	array
end

release_0
release_1
release_2