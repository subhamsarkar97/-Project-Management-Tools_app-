class ProjectMailer < ApplicationMailer
    
    def add_project
        @user = params[:user]
        mail(to: @user.username, subject: 'Project is Created')
    end    

    def delete_project
        @user = params[:user]
        mail(to: @user.username, subject: 'Project is Deleted')
    end    
end
