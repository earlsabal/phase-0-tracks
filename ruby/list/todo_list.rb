class TodoList
	def initialize(list)
		@list = list
	end

	def get_items
		@list
	end
	
	def add_item(task)
		@list << task
	end
end