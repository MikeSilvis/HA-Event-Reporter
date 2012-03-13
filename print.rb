class Print

	def initialize(queue)
		first_name_length(queue)
		last_name_length(queue)
		email_length(queue)
		city_length(queue)
		street_length(queue)	

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
						user.last_name.ljust(@last_name_size, " "), 
						user.first_name.ljust(@first_name_size, " "), 
						user.email.ljust(@email_size, " "), 
						user.zipcode.ljust(12, " "), 
						user.city.ljust(@city_size, " "), 
						user.state.ljust(3, " "), 
						user.street.ljust(@street_size, " ")
					  ]
	end

	def find_length(array)
		char_count = array.max_by{|word| word.length}.length
	end

	def first_name_length(queue)

		first_name_length_var = queue.collect do |user|
			user.first_name
		end

		first_name_length_var << "FIRST NAME"
		@first_name_size = find_length(first_name_length_var)
	end

	def last_name_length(queue)
		last_name_length_var = queue.collect do |user|
			user.last_name
		end
		last_name_length_var << "LAST NAME"
		@last_name_size = find_length(last_name_length_var)
	end

	def email_length(queue)
		email_length_var = queue.collect do |user|
			user.email
		end
		email_length_var << "EMAIL"

		@email_size = find_length(email_length_var)
	end

	def city_length(queue)
		city_length_var = queue.collect do |user|
			user.city
		end
		city_length_var << "CITY"
		@city_size = find_length(city_length_var)
	end

	def street_length(queue)
		street_length_var = queue.collect do |user|
			user.street
		end
		street_length_var << "STREET"
		@street_size = find_length(street_length_var)
	end

	def fields
		@fields = [
					"LAST NAME".ljust(@last_name_size, " "),
					"FIRST NAME".ljust(@first_name_size, " "),
					"EMAIL".ljust(@email_size, " "),
					"ZIPCODE".ljust(12, " "),
					"CITY".ljust(@city_size, " "),
					"STATE".ljust(3, " "),
					"STREET".ljust(@street_size, " "),					
				  ]
	end
end