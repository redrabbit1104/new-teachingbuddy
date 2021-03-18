class AdminroomsController < ApplicationController

  def index
  end
  
  def new
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)
    
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
    @admin_room = AdminRoom.new(room_params)
    @admin_room.save
    redirect_to adminroom_adminmessages_path(AdminRoom.last.id)
  end

  def destroy
    @adminroom = AdminRoom.find(params[:id])
    @adminroom.destroy
    redirect_to root_path
  end

private
  
  def room_params
    params.require(:admin_room).permit(:admin_id,:user_id)
  end

  # def room_admin_user_params
  #   params.require(:room_admin_user).permit(:target_id, :user_id, :admin_id, :room_id)
  # end
  
end
