class TagMailer < ApplicationMailer
    def notif_tag
        @user = params[:user]
        mail(to: @user.email, subject:'Mention de votre nom.')
    end
end
