class Help

    def initialize
        commands
    end

    def base(input)
        #puts input
        if input.length > 0
            show_more_help(input)
        else
            puts @fields["help"]
            puts @fields.keys.join(", ")
        end

        puts " "
        puts " "
    end

    def commands
        @fields = Hash.new
        @fields["load <filename>"]              = "This command will help you "
                                              "be able to load a specific "+
                                                 " file that is already in "+
                                                  "the correct directory"
        @fields["help"]                     = "A list of potential commands."
        @fields["help <command>"]        = "Displays more information about"+
                                              "a specific command."
        @fields["find"]                         = "Used to query your CSV"
        @fields["queue count"]                  = "Counts the records from"+
                                                  "your most recent query"
        @fields["queue clear"]                  = "Empty the queue"
        @fields["queue print"]                  = "Print out a tab-delimited"+
                                                "data table with a header row"
        @fields["queue print by <attribute>"]= "Print the data table sorted"+
                                             "by the specified attribute "+
                                                  "like zipcode."
        @fields["queue save to <filename.csv>"] = "Saves a specified file to"+
                                                  "the directory"
        @fields["queue clear"]                  = "Clears the queue"
        @fields["find <attribute> <criteria>"]  = "Finds all results by a "+
                                                    "specific column"
        @fields["quit"]                         = "The world implodes..."
    end

    def show_more_help(input)
        if @fields.has_key? input
            puts @fields[input]
        else
            puts "I don't know how to handle that"
        end
    end
end