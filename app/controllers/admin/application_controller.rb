class Admin::ApplicationController < ActionController::Base
    layout 'admin/application'
    before_action :authenticate_user!
    before_action :validate_admin

    def validate_admin
        if current_user.isadmin.nil? || current_user.isadmin < 1
            redirect_to games_path, alert: 'Permission denied!'
        end
    end
end
