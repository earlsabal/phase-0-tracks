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

	def delete_item(task)
		index_to_delete = @list.index(task)
		@list.delete_at(index_to_delete)
	end
end