class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    include PublicActivity::StoreController

    add_flash_types :danger, :info, :warning, :success

    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                session[:user_id] = user.id
                @current_user = user
            end
        end
    end

    def save_in_session(auth_hash)
        i = 1
        user_mail = auth_hash.dig(:extra, :raw_info, :mail) || auth_hash.dig(:extra, :raw_info, :userPrincipalName)
        email_array = User.all.map {|user| user.username}
        email_array.each do |mail|    
            if user_mail == mail
                user = User.find_by(username: mail)
                return user  
            else
                i = i+1
                next
            end
        end    
        if i > 1
            @user  = User.new(username: user_mail, firstname: auth_hash.dig(:extra, :raw_info, :displayName) )
            @user.save 
            redirect_to user_path(@user)
        end    
    end    
    
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    def current_project
        @current_project ||= Project.find_by(id: session[:project_id])
    end 

    def current_feature
        @current_feature ||= Feature.find_by(id: session[:feature_id])
    end 
    
    def logged_in?
        !current_user.nil?
    end  
    
    def authorized   
        redirect_to welcome_path unless logged_in?
    end
    
end
