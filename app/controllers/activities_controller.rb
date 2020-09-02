class ActivitiesController < ApplicationController
    before_action :authorized, only: [:index]
    
    def index
        @user_id = current_user.id
        @activities = PublicActivity::Activity.order("Created_at desc")   
    end
end
  
