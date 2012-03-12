class FindUsers

	CSV_OPTIONS = {:headers => true, :header_converters => :symbol}

	def initialize(filename, options = CSV_OPTIONS)
		file = CSV.open(filename, options)	
		load_all_users(file)
	end

	def search(attribute = nil, criteria = nil)
		if attribute.nil?
			search_default
		else
			search_with_attributes(attribute, criteria)
		end
	end

	def search_with_attributes(attribute, criteria)
		@user_array = []
		return @user_array if !verify_attribute(attribute)

		@all_users.each do |user|
			@user_array << user if user.send(attribute) == criteria
		end

		return @user_array
	end

	def search_default
		@user_array = []
		@all_users.each do |user|
			@user_array << user
		end	

		return @user_array
	end

	private

	def load_all_users(file)
		@all_users = []

		file.each do |line|
			@all_users << User.new(line)
		end
	end

	def find_users(&block)
	 	@all_users.each do |user|
	 		block.call(user)
	 	end
	end

	def verify_attribute(attribute)
		User.new.respond_to? attribute
	end
end
