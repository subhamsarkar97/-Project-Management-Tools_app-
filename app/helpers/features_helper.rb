module FeaturesHelper
    def current_user_project
        @user_id = current_user.id
        @project_id = current_project.id
    end    
end
