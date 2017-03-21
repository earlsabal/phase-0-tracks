# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create method that takes a string as parameter
  # Break string into array of items
  # Create an empty hash
  # Assign each item as a new key in the hash
  # set default quantity to 1
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

def create_list(string_of_items)
	grocery_items = string_of_items.split(" ")
	grocery_list = {}
	default_quantity = 1
	grocery_items.each do |item|
		grocery_list[item.to_sym] = default_quantity
	end
	grocery_list
end

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
	# Create method that takes in 3 parameters
	# Update list with new item name with key
	# Set the key's value to optional quatnity
# output:
	# Returns an updated hash with new item

def add_item(list, item_name, qty)
	list[item_name.to_sym] = qty
	list
end

# Method to remove an item from the list
# input: 
	# Create method that takes in two parameters a hash and a string
# steps:
	# Search list for item
	# Delete item for list
# output:
	# Returns an updated hash after removing one item

def remove_item(list, item_name)
	list.delete(item_name.to_sym)
	list
end

# Method to update the quantity of an item
# input: Create method that takes in 3 parameters a hash, string, and a integer
# steps:
	# Search for the item in the list
	# Update the searched item with a new quantity
# output:
	# Returns an updated hash with new quantity

def update_quantity(list, item_name, qty)
	list[item_name.to_sym] = qty
	list
end

# Method to print a list and make it look pretty
# input: Will take in one parameter, a hash
# steps:
	# Iterate through each element in the hash
		# print the key and value
# output: Prints all keys with their value

def print_list(list)
	list.each do |item, qty|
		puts "#{item.to_s} - #{qty}"
	end
end

list = create_list("apple oranges carrots")
add_item(list, "bananas", 2)
remove_item(list, "apple")
update_quantity(list, "oranges", 5)
print_list(list)