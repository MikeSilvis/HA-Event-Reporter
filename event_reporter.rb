require 'csv'
require 'ap'

$LOAD_PATH << './'
require 'help'
require 'user'
require 'find_users'
require 'queue'

class EventReporter
    CSV_OPTIONS = {:headers => true, :header_converters => :symbol}

    def initialize
        @help = Help.new
        @queue = Hash.new
        @queue_class = Queue.new(@queue)
        @find = FindUsers.new
    end

    def run
        puts "Welcome to the Event Reporter Client!"
        command = ""
        while command != "quit" && command != "exit"
            printf "Your command: "
            input = gets.chomp.split(" ")
            command = input[0]
            case_method(command,input)
        end
    end

    def case_method(command,input)
        case command
            when 'quit'     then puts "Goodbye!"
            when 'exit'     then puts "Goodbye!"
            when 'help'     then @help.base(input[1..-1].join(" "))
            when 'load'     then load(input[1])
            when 'queue'
                then @queue_class.base(input[1..-1].join(" "),@queue)
            when 'find'
                then @queue = @find.search(input[1], input[2..-1])
            else
              puts "Sorry, I don't know how to (#{command})"
        end
  end

    def load(filename)
        if filename.nil?
            filename = 'event_attendees.csv'
        end

        file = CSV.open(filename, CSV_OPTIONS)
        all_users = load_all_users(file)

        @find = FindUsers.new(all_users)
        @queue = Hash.new
        puts "File succesfully loaded"
    end

def load_all_users(file)
    all_users = file.collect do |line|
        User.new(line)
    end
end

end

et = EventReporter.new
et.run