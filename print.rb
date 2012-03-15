class Print

    attr_accessor :fields, :field_lengths, :queue

    def initialize(queue)
        self.queue = queue

        find_length_of_fields
        print
    end

    def print
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
            Utility::Clean.name(user.last_name).ljust(field_lengths[0]),
            Utility::Clean.name(user.first_name).ljust(field_lengths[1]),
            user.email_address.ljust(field_lengths[2]),
            user.zipcode.ljust(12),
            Utility::Clean.titleize(user.city).ljust(field_lengths[3]),
            Utility::Clean.state(user.state).ljust(3),
            Utility::Clean.titleize(user.street).ljust(field_lengths[4]),
            user.number.ljust(11)
        ]
    end

    def find_length(array)
        char_count = array.max_by{|word| word.length}.length
    end

    def find_length_of_fields
        fields = %w(last_name first_name email_address city street)
        self.field_lengths = fields.collect do |field|
            field_col = queue.collect do |user|
                user.send(field)
            end
            field_col << field
            find_length(field_col)
        end
    end

    def fields
        self.fields = [
            "LAST NAME".ljust(field_lengths[0], " "),
            "FIRST NAME".ljust(field_lengths[1], " "),
            "EMAIL".ljust(field_lengths[2], " "),
            "ZIPCODE".ljust(12, " "),
            "CITY".ljust(field_lengths[3], " "),
            "STATE".ljust(3, " "),
            "STREET".ljust(field_lengths[4], " "),
            "PHONE".ljust(11, " ")
        ]
    end
end