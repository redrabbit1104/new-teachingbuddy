class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    #現在ログイン中のidを除いたユーザー情報を取得
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)

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
    date_today
    board_page
  end

  def create
    board = Board.create(post_params)
    render json:{ board: board }
  end

  def edit
    @users_except_current_user = User.where.not(id: current_user)
    @users = @users_except_current_user.page(params[:users_page]).per(6)
    
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
    date_today
  end

  def update
    @board.update(edit_post_params)
    redirect_to root_path
  end

  def destroy
    @board.destroy
    # NotificationMailer.send_when_signup(@user).deliver
    redirect_to root_path
  end

  private

  def post_params
   params.permit(:post).merge(user_id: current_user.id)
  end

  def edit_post_params
    params.require(:board).permit(:post).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def date_today
    require "date"
    now = Date.today
    wday = now.wday
    wday_jan = ["月","火","水","木","金","土","日"]
    @this_year = now.year
    @this_month = now.month
    @this_day = now.day
    @this_wday = wday_jan[wday - 1]
  end

  def board_page
    @boards = Board.all
    @boards = Board.page(params[:page]).per(7)
  end

end
