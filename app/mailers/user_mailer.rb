class UserMailer < ApplicationMailer

  def notif_update
    @author = params[:author]
    @editor = params[:editor]
    @date = params[:date]
    mail(to: @author.email, subject:'Article Modifie.')
  end
end
