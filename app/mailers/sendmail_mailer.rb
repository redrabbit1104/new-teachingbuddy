class SendmailMailer < ApplicationMailer

  def welcome_email(user)
    @user =  user
    @url  = 'http://localhost:3000/'
    # mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
    mail(to:'s86.jung.sangjin@gmail.com', subject: '私の素敵なサイトへようこそ')
  end
end
