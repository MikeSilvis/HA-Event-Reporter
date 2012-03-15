$LOAD_PATH << './'
require "print"

class FindUsers

    def initialize(all_users=nil)
        if all_users.nil?
            @all_users = []
        else
            @all_users = all_users
        end
        #puts @all_users
    end

    def search(attribute = nil, criteria = nil)
        if attribute.nil?
            search_default
        else
            search_with_attributes(attribute, criteria.join(" "))
        end
        Print.new(@user_array)

        return @user_array
    end

    def search_with_attributes(attribute, criteria)
        @user_array = []
        return @user_array if !verify_attribute?(attribute)

        @all_users.each do |user|
            @user_array << user if user.send(attribute) == criteria.downcase
        end
        return @user_array
    end

    def search_default
        @user_array = @all_users.collect do |user|
            user
        end
    end

    private

    # def find_users(&block)
    #     @all_users.each do |user|
    #         block.call(user)
    #     end
    # end

    def verify_attribute?(attribute)
        User.new.respond_to? attribute
    end
end
