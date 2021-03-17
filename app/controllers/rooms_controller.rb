class RoomsController < ApplicationController
  
  def new
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)
    @new_room_users = @users_except_current_user.page(params[:user_page])
    @room = Room.new
    @all_room = RoomUser.all
    @length= @all_room.length

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
    @room = Room.new(room_params)
    @room.save
    redirect_to room_messages_path(Room.last.id)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

private
  
  def room_params
    params.require(:room).permit(user_ids: []).merge(target_id: params[:room][:user_ids][1])
  end

end