def search_array(array, target_number)
	index = 0
	array.each do |number|
		if number == target_number
			return index
		end
		index += 1
	end
	nil
end
=begin

arr = [42, 89, 23, 1]
p search_array(arr, 1) == 3
p search_array(arr, 24) == nil
=end

def fib(number_of_elements)
	numbers = [0, 1]
	prev_index = 0
	index = 1
	while numbers.length < number_of_elements
		numbers << numbers[prev_index] + numbers[index]
		prev_index = index
		index += 1
	end
	numbers
end

p fib(6)
p fib(100)
p fib(100).last == 218922995834555169026