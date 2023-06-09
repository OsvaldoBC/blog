class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:comment][:post_id])
    @comment.user_id = current_user.id

    if @comment.save
      @comment.post.update(author_id: current_user.id)
      redirect_to user_post_path(@comment.post.author_id, @comment.post_id)
    else
      redirect_to user_post_path(@comment.post.author_id, params[:comment][:post_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy
    # redirect_to previous url link or page if available
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
