class Help

	def initialize

	end

	def base
		puts "This is the Event Reporter help section."
		puts ""
		puts ""	
	end

	def commands
		@fields = Array["load<filename>","help", "help <command>", "find", "queue", "queue count", "queue print", 
						"queue print by <attribute>", "queue save to <filename.csv>", "file <attribute> <criteria>", "queue clear", "quit"]
	end

end