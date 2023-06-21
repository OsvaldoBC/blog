class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @user = User.find(params[:user_id])
    #@post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :text)
  end
end
