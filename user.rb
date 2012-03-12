class User
	attr_accessor :last_name, :first_name, :email, :zipcode, :address, :city, :state, :street, :number
	INVALID_ZIPCODE = 0 * 5

	def initialize(attr_array)
		@last_name 		= attr_array[:last_name].to_s
		@first_name 	= attr_array[:first_name].to_s
		@email 			= attr_array[:email_address].to_s
		@zipcode		= clean_zip(attr_array[:zipcode])
		@number  		= clean_number(attr_array[:homephone])
		@address		= attr_array[:street].to_s	
		@city 			= attr_array[:city].to_s
		@state			= attr_array[:state].to_s
	end

	private

	def clean_zip(number)
		if number.nil?
			fixed_numb = INVALID_ZIPCODE
		elsif number.length < 5
			fixed_numb = sprintf '%05d', number
		else
			fixed_numb = number
		end
		return fixed_numb.to_s
	end

	def clean_number(number)
		number = number.gsub(/\D/,"")

		if number.length == 10
			## all good
		elsif number.length == 11
			number = number[1..-1]
		else
			number = "0000000000"
		end
		return number.to_s
	end

	def clean_name(name)
		clean_name = name.downcase.Capitalize

		return clean_name
	end

end