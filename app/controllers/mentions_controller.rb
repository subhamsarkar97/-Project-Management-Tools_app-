class MentionsController < ApplicationController
    before_action :authorized, only: [:index]
    
    def index
        @user = User.all
        respond_to do |format|
            format.json
        end    
    end    

end
