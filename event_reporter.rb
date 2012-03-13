require 'csv'
require 'ap'

$LOAD_PATH << './'
require 'help'
require 'user'
require 'find_users'
require 'queue'

class EventReporter

	def initialize(filename)
		@help = Help.new
		@find = FindUsers.new(filename)
		@queue = Hash.new		
		@queue_class = Queue.new(@queue)
	end

	def run
		puts "Welcome to the Event Reporter Client!"
		command = ""
		while command != "quit"
			printf "Your command: "
			input = gets.chomp.split(" ")
			command = input[0]
			case command
				when 'quit' 	then puts "Goodbye!"
				when 'help' 	then @help.base(input[1..-1].join(" "))
				when 'load'		then load(input[1])
				when 'queue'	then @queue_class.base(input[1..-1].join(" "),@queue)
				when 'find' 	then @queue = @find.search(input[1], input[2..-1])
				else
				  puts "Sorry, I don't know how to (#{command})"
			end		
		end			
	end

	def load(filename)
		@find = FindUsers.new(filename)

		puts "File succesfully loaded"
	end
end

et = EventReporter.new("event_attendees.csv")
et.run