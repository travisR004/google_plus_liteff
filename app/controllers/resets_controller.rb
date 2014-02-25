class ResetsController < ApplicationController
  def edit
    @user = User.find_by(:reset_token => params[:reset_token])
  end

  def update
    @user = User.find_by(:reset_token => user_params[:reset_token])
    if @user.update_attributes(user_params)
      redirect_to new_session_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def new
  end

  def create
    foo = UserMailer.reset_password_email(User.find_by(:email => params[:user][:email]))
    redirect_to new_session_url
    foo.deliver!
  end

  private
  def user_params
    params.require(:user).permit(:password, :reset_token)
  end


end
