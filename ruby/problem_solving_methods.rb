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

arr = [42, 89, 23, 1]
p search_array(arr, 1) == 3
p search_array(arr, 24) == nil

def fib(number_of_elements)
	numbers = [0, 1]
	prev_index = 0
	for index 1...number_of_elements
		numbers << prev_index + index
	end
	numbers
end

fib(6)