require 'csv'
require 'ap'
load 'help.rb'
load 'user.rb'
load 'find_users.rb'

class EventReporter

	def initialize(filename)
		puts "EventReporter Initialized."
		@help = Help.new
		@find = FindUsers.new(filename)
	end

	def run
		puts "Welcome to the Event Reporter Client!"
		command = ""
		while command != "q"
			puts "Potential Commands: \t load<filename> \t help \t help <command> \t find \t queue count \t queue print \t queue printer by <attribute> \t queue save to <filename.csv> \t file <attribute> <criteria> \t queue clear \t q"
			printf "Your command: "
			input = gets.chomp.split(" ")
			command = input[0]
			case command
				when 'q' 	then puts "Goodbye!"
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
		puts "Results: " + @queue.length.to_s 
		puts "LAST NAME \t FIRST NAME \t EMAIL \t ZIPCODE \t CITY \t STATE \t ADDRESS"
		@queue.each do |user|
			puts user.last_name + "\t" + user.first_name + "\t" + user.email + "\t" + user.zipcode + "\t" + user.city + "\t" + user.state + "\t" + user.address
		end
		puts ""
		puts ""
	end

	def queue
		# Do stuff with Queue
	end
end

et = EventReporter.new("event_attendees.csv")
et.run