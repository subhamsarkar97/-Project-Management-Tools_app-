class CommentMailer < ApplicationMailer
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.comment_mailer.comment_mail.subject
    #
    def comment_mail(comment)
        @comment = comment
        @feature = @comment.feature
        mail(to: @feature.mailId, subject: "Comment is added for #{@feature.title}")
    end
end
