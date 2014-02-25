class FriendCirclesController < ApplicationController
  before_action :get_friend_circle, only: [:show, :edit, :update, :destroy]
  def new
    @friend_circle = FriendCircle.new
  end

  def create
    @friend_circle = current_user.friend_circles.new(friend_circle_params)

    if @friend_circle.save
      redirect_to friend_circle_url(@friend_circle)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :new
    end
  end

  def index
    @friend_circles = FriendCircle.where(creator_id: current_user.id)
  end

  def edit
  end

  def update
    if @friend_circle.update_attributes(friend_circle_params)
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  def show
  end

  private

  def friend_circle_params
    params.require(:friend_circle).permit(:title, :user_ids => [])
  end

  def get_friend_circle
    @friend_circle = FriendCircle.find(params[:id])
  end



end
