class Print

	def initialize(queue)
		find_length_of_fields(queue)

		print(queue)
	end

	def print(queue)
		puts "Results: " + queue.length.to_s
		puts fields.join("\t")

		queue.each do |user|
			puts array_for_printing_users(user).join("\t")
		end

		puts ""
		puts ""
	end

	def array_for_printing_users(user)
		user_array = [
			user.last_name.ljust(@field_lengths[0], " "), 
			user.first_name.ljust(@field_lengths[1], " "), 
			user.email.ljust(@field_lengths[2], " "), 
			user.zipcode.ljust(12, " "), 
			user.city.ljust(@field_lengths[3], " "), 
			user.state.ljust(3, " "), 
			user.street.ljust(@field_lengths[4], " ")
		]
	end

	def find_length(array)
		char_count = array.max_by{|word| word.length}.length
	end

	def find_length_of_fields(queue)
		@field_lengths = []
		fields = %w(last_name first_name email city street)
		@field_lengths = fields.collect do |field|
			field_col = queue.collect do |user|
				user.send(field)
			end
			find_length(field_col)
		end
	end

	def fields
		@fields = [
			"LAST NAME".ljust(@field_lengths[0], " "),
			"FIRST NAME".ljust(@field_lengths[1], " "),
			"EMAIL".ljust(@field_lengths[2], " "),
			"ZIPCODE".ljust(12, " "),
			"CITY".ljust(@field_lengths[3], " "),
			"STATE".ljust(3, " "),
			"STREET".ljust(@field_lengths[4], " "),					
		]
	end
end