class SendmailMailer < ApplicationMailer

  def notify_schedule_email(user)
    @user_last_name =  user.last_name
    @url  = 'http://54.248.212.236/'
    mail(to:'s86.jung.sangjin@gmail.com', subject: "【#{@user_last_name}様】確定したスケジュールのお知らせ")
  end
end
