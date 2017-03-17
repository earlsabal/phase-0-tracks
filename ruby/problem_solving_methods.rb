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

def insertion_sort(array)
	current_index = 1
	while current_index < array.length
		current_number = array[current_index]
		array.delete_at(current_index)
		sorting_index = 0
		while sorting_index <= current_index
			if sorting_index == current_index
				array.insert(sorting_index, current_number)
			else
				if current_number < array[sorting_index]
					array.insert(sorting_index, current_number)
					break
				end
			end
			sorting_index += 1
		end
		current_index += 1
	end
	array
end

p insertion_sort([5, 2, 3, 4, 7, 1]) == [1, 2, 3, 4, 5, 7]