require 'csv'
require 'ap'

$LOAD_PATH << './'
require 'help'
require 'user'
require 'find_users'

class EventReporter

	def initialize(filename)
		puts "EventReporter Initialized."
		@help = Help.new
		@find = FindUsers.new(filename)
		@queue = Hash
	end

	def run
		puts "Welcome to the Event Reporter Client!"
		command = ""
		while command != "quit"
			puts "Potential Commands: \t" + @help.commands.join("\t")
			printf "Your command: "
			input = gets.chomp.split(" ")
			command = input[0]
			case command
				when 'quit' then puts "Goodbye!"
				when 'help' then @help.base
				when 'load'	then load(input[1])
				when 'find'
					@queue = @find.search(input[1], input[2])
					print
				else
				  puts "Sorry, I don't know how to (#{command})"
			end		
		end			
	end

	def load(filename)
		@find = FindUsers.new(filename)

		puts "File succesfully loaded"
	end

	def print
		puts "Results: " + @queue.length.to_s unless @queue.length == 0
		puts User.new.fields.join("\t") unless @queue.length == 0
		@queue.each do |user|
			puts array_for_printing_users(user).join("\t")
		end
		puts ""
		puts ""
	end

	def array_for_printing_users(user)
		user_array = [user.last_name, user.first_name, user.email, user.zipcode, 
					user.city, user.state, user.street]
	end
end

et = EventReporter.new("event_attendees.csv")
et.run