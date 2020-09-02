class DeleteFeatureMailer < ApplicationMailer

    def delete_mail
        @feature = params[:feature]
        mail(to: @feature.mailId, subject: 'Feature is deleted')
    end    

end
