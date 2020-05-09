module Admin::UsersHelper
    def admin_level_to_string(admin_level)
        if admin_level == 2
            "Legendary Admin"
        elsif admin_level == 1
            "Admin"
        else
            "Default user"
        end
    end
end
