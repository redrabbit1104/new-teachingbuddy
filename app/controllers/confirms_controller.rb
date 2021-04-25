class ConfirmsController < ApplicationController
  before_action :confirms_params, only: [:switch]
  
  def switch
      #confirmテーブルにユーザーidが存在しない場合は、新たにチェックを入れるとしてcheck値をテーブルに生成する
      if Confirm.where(user_id:params[:user_id], schedule_id:params[:id]).blank?
        if params[:check].to_i == 1
           @switch = "post"
           Confirm.create(confirms_params)
           @user = User.find(params[:user_id])
           SendmailMailer.notify_schedule_email(@user).deliver
           redirect_to preview_schedule_path
        else
           redirect_to preview_schedule_path
        end
      else
      #confirmテーブルにユーザーidが存在する場合はcheckの更新を行う
      @switch = "delete"
      Confirm.find_by(user_id:params[:user_id], schedule_id:params[:id]).destroy
      redirect_to preview_schedule_path
      end
  end

  def next_switch
    #confirmテーブルにユーザーidが存在しない場合は、新たにチェックを入れるとしてcheck値をテーブルに生成する
    if Confirm.where(user_id:params[:user_id], schedule_id:params[:id]).blank?
      if params[:check].to_i == 1
         @next_switch = "post"
         Confirm.create(confirms_params)
         SendmailMailer.notify_schedule_email(@user).deliver
         redirect_to next_preview_schedule_path
      else
         redirect_to next_preview_schedule_path
      end
    else
    #confirmテーブルにユーザーidが存在する場合はcheckの更新を行う
    @next_switch = "delete"
    Confirm.find_by(user_id:params[:user_id], schedule_id:params[:id]).destroy
    redirect_to  next_preview_schedule_path
    end
end

  private
  def confirms_params
    params.permit(:check).merge(admin_id: current_admin.id, schedule_id: params[:id], user_id: params[:user_id])
  end
end
