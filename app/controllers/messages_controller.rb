class MessagesController < ApplicationController

  def index
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user).order("created_at DESC")

    @target_adminroom = AdminRoom.all
    @target_users = User.all
    @target_room = []
    @target_users.each do |user|
      @target_room << @target_adminroom.where(user_id:user.id).pluck(:id)[0]
    end
    
    if user_signed_in?
    #userで接続した場合、adminとのチャットに表示されるリストのリンクに必要なパラメーター
    @adminrooms = AdminRoom.where(user_id: current_user.id)
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id,room_id:params[:room_id].to_i)
  end

end
