class User
	attr_accessor :last_name, :first_name, :email, :zipcode, :city, :state, :street, :number
	INVALID_ZIPCODE = 0 * 5

	def initialize(attr_array = nil)
		if attr_array
			@last_name 		= Utility::Clean.name(attr_array[:last_name])
			@first_name 	= Utility::Clean.name(attr_array[:first_name])
			@email 			= attr_array[:email_address]
			@zipcode		= Utility::Clean.zip(attr_array[:zipcode])
			@number  		= Utility::Clean.number(attr_array[:homephone])
			@street			= attr_array[:street].to_s
			@city 			= Utility::Clean.titleize(attr_array[:city])
			@state			= attr_array[:state].to_s
		end
	end

end

module Utility

	class Clean

		def self.zip(dirty_zipcode)
			dirty_zipcode.to_s.rjust(5,'0')
		end

		def self.number(dirty_number)
		    number = dirty_number.gsub(/\D/,"")
		  	
		    if number.length == 10
		  	  ## all good
		  	elsif number.length == 11
		  	  number = number[1..-1]
		  	else
		  	  number = "0000000000"
		  	end
		  	return number
		end

		def self.name(dirty_name)
			name = dirty_name.downcase.capitalize.to_s
		end

		def self.titleize(dirty_city)
			city = dirty_city.to_s.split(" ").collect(&:capitalize).join(' ').to_s
		end
	end

end
