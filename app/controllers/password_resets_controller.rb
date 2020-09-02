class PasswordResetsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :edit, :update]

    def new
    end

    def create
        @user = User.find_by(username: params[:password_reset][:username].downcase)
        if @user
            @user.create_reset_digest
            @user.send_password_reset_email
            redirect_to welcome_path, success: "Email sent with password reset instructions"
        else
            redirect_to new_password_reset_path, danger: "Email address is not found"
        end
    end  

    def edit
        @user = User.find_by(username: params[:username])
    end
    
    def update
        @user = User.find_by(username: params[:username])
        if @user.reset_sent_at < 2.hours.ago
            redirect_to new_password_reset_path, danger: "Password reset token is expired"
        elsif @user.update_attributes(user_params)
            redirect_to welcome_path, success: "Password has been reset"
        else
            render :edit
        end            
    end  

    private
    def user_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end
