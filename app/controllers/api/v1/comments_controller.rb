class Api::V1::CommentsController < ApiController
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        respond_to do |format|
            format.json { render json: @comments, status: 200 }
          end
      end
    
      def create
        @post = Post.find(params[:post_id])
    
        return unless @post.comments.create(text: params[:comment][:text], author: @current_user)
    
        render json: { success: 'Comment created successfully' }
      end

end
