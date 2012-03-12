class User
	attr_accessor :last_name, :first_name, :email, :zipcode, :city, :state, :street, :number
	INVALID_ZIPCODE = 0 * 5

	def initialize(attr_array = nil)
		if attr_array
			@last_name 		= attr_array[:last_name]
			@first_name 	= attr_array[:first_name]
			@email 			= attr_array[:email_address]
			@zipcode		= Utility::Zipcode.clean(attr_array[:zipcode])
			@number  		= attr_array[:homephone]
			@street			= attr_array[:street]	
			@city 			= attr_array[:city]
			@state			= attr_array[:state]
		end
	end

	# def initialize(attr_array={})
	# 	super
	# end

	# def zipcode
	# 	Utility::Zipcode.clean(@zipcode)
	# 	# if number.nil?
	# 	# 	fixed_numb = INVALID_ZIPCODE
	# 	# elsif number.length < 5
	# 	# 	fixed_numb = sprintf '%05d', number
	# 	# else
	# 	# 	fixed_numb = number
	# 	# end
	# 	# return fixed_numb.to_s
	# end

	def fields
		@fields = %w(LAST\ NAME FIRST\ NAME EMAIL ZIPCODE CITY STATE CITY STREET)
	end

	# def first_name
	# 	clean_name = name.downcase.Capitalize

	# 	return clean_name
	# end

end

module Utility

	class Zipcode
		def self.clean(dirty_zipcode)
			dirty_zipcode.to_s.rjust(5,'0')
		end
	end

	class PhoneNumber
		def initialize(phone_number)
			@phone_number = phone_number.scan(/\d/)
		end

		def to_s
			"(#{@phone_number[0..2]}) #{@phone_number[3.5]}-#{@phone_number[6..9]}"
		end
	end

end
