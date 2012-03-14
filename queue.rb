$LOAD_PATH << './'
require "print"

class Queue

	def initialize(queue)
		@queue = queue
		@whole_command = []
		commands
	end

	def base(input,queue)
		@queue = queue
		parts = input.split(" ")
		@whole_command = parts[1..-1]

		if @queue_fields.has_key? parts[0]
			@queue_fields[send(parts[0])]
		else
			puts "I don't know how to handle that"
		end
	end

	def commands
		@queue_fields = Hash.new
		@queue_fields["count"] 					= count(false)
		@queue_fields["clear"] 					= clear(false)
		@queue_fields["print"] 					= print(false)
		@queue_fields["save"]					= save(false)
	end 

	def count(print_var=true)
		puts "You have #{@queue.size} records in your queue" if print_var
	end

	def clear(print_var=true)
		@queue.clear
		puts "Your queue has been cleared" if print_var
	end 

	def print(print_var=true)
		if @queue.size > 0
			if @whole_command.empty?
				Print.new(@queue)		
			else
				print_by_attribute(true,@whole_command)
			end
		else
			puts "You have nothing in your queue yet!" if print_var		
		end
	end

	def print_by_attribute(print, attribute=[]) 
		if attribute[1]
			return puts "Not a valid attribute" if !verify_attribute?(attribute[1])

			user_array = @queue.sort_by { |user| user.send(attribute[1]) }

			Print.new(user_array)
		end
	end

	def save(print_var=true)
		save_to(true, @whole_command) if print_var
	end

	def output_fields
		return %w(LAST\ NAME FIRST\ NAME EMAIL ZIPCODE CITY STATE STREET)
	end

	def save_to(print,attribute=[])
		output_filename = attribute[1]

		output = CSV.open(output_filename, "w")
		output << output_fields
		
		@queue.each do |user|
			output << [
						user.last_name, user.first_name, user.email, user.zipcode, 
						user.city, user.state, user.street
					  ]
		end
		puts "File Created."
	end

	def verify_attribute?(attribute)
		User.new.respond_to? attribute
	end

end
