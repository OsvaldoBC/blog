class Api::V1::PostsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @posts = Post.all.includes(:comments)
        respond_to do |format|
            format.json { render json: @posts, status: 200 }
          end
      end
end
