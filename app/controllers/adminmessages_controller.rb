class AdminmessagesController < ApplicationController
  def index
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)
    @adminroom = AdminRoom.find(params[:adminroom_id])
    @messages = @adminroom.admin_messages.includes(:user).order("created_at DESC")

    @target_adminroom = AdminRoom.all
    @target_users = User.all
    @target_room = []
    @target_users.each do |user|
      @target_room << @target_adminroom.where(user_id:user.id).pluck(:id)[0]
    end

    if user_signed_in?
    @adminrooms = AdminRoom.where(user_id: current_user.id)
    end
  end

  def create
    @admin_room = AdminRoom.find(params[:adminroom_id])
    @admin_message = AdminMessage.new(admin_message_params)
    if @admin_message.save
      redirect_to adminroom_adminmessages_path(@admin_room)
    else
      @messages = @adminroom.admin_messages.includes(:user)
      render :index
    end
  end

  private

  def admin_message_params
    if user_signed_in?
    params.permit(:content, :image).merge(admin_id: 1,admin_room_id: params[:adminroom_id],user_id: AdminRoom.find(params[:adminroom_id]).user_id)
    else
      params.permit(:content, :image).merge(admin_id: 1,admin_room_id: params[:adminroom_id],user_id: AdminRoom.find(params[:adminroom_id]).user_id,flag: 1)
    end
  end

end
