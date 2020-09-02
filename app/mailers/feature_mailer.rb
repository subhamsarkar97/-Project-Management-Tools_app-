class FeatureMailer < ApplicationMailer
    
    def assign_feature
        @feature = params[:feature]
        mail(to: @feature.mailId, subject: 'Feature Assigned')
    end
    
    def update_feature
        @feature = params[:feature]
        mail(to: @feature.mailId, subject: 'Status updated')
    end
    
end
