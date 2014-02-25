class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    post = @user.posts.new(post_params).first
    post.links.new(link_params)

    if @user.save
      redirect_to post_url(post)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def feed

  end





  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def post_params
    params.permit(:post => [:body, :title])
          .require(:post)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end

  def link_params
    params.permit(:links => [:url])
          .require(:links)
          .values
          .reject { |data| data[:url].blank? }
  end
end
