class FindUsers

	def initialize(filename)
		@file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
		@user_array = []		
	end

	def search(attribute = nil, criteria = nil)
		@file.each do |line|
			user = User.new(line)
			if attribute
				@user_array << user if user.send(attribute) == criteria
			else
				@user_array << user
			end
		end
		return @user_array
	end

end