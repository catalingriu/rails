class Admin::UsersController < Admin::ApplicationController
    def self.search(query)
        where("name like ?", "%#{query}%")
   end
end
