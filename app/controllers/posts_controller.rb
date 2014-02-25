class PostsController < ApplicationController
  before_action :get_post, only: [:show,:edit,:update,:destroy]
  before_action :require_logged_in
  def index
  end

  def new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.links.new(link_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show

  end

  def upvote
    @upvote = Upvote.new(post_id: params[:post_id])
    @upvote.user_id = current_user.id
    @upvote.save!
    redirect_to post_url(params[:post_id])
  end

  private
  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :friend_circle_ids => [])
  end

  def link_params
    params.permit(:links => [:url])
          .require(:links)
          .values
          .reject { |data| data[:url].blank? }
  end

  def require_logged_in
    redirect_to root_url unless logged_in?
  end



end
