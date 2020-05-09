class Admin::UsersController < Admin::ApplicationController
    
   def index
        if params[:search]
            @users = User.search(params[:search]).all
        else
            @users = User.all
        end
   end

   def change_admin
        @level_to_become = params[:level].to_i
        @user = User.find(params[:id])

        if @user.isadmin >= current_user.isadmin || @level_to_become >= current_user.isadmin || @level_to_become<0
            redirect_to admin_users_path, alert: 'Permission denied'
        else
            @user.isadmin = @level_to_become
            @user.save
            
            redirect_to admin_users_path
        end
        
   end
end
