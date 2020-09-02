class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url  = 'http://localhost:3000/login'
        mail(to: @user.username, subject: 'Welcome to Project Management Tool App.')
    end  
    
    def delete_profile
        @user = params[:user]
        mail(to: @user.username, subject: "Your profile is successfully deleted")
    end  
     
    def password_reset(user)
        @user = user
        mail(to: @user.username, subject: "Password Reset")
    end    
end
