class CommentsController < ApplicationController
  before_action :set_post, only:[:new,:create]
  
  def create
    @comment= @post.comments.new(comment_params)
    @comment.user_id=session[:user_id]
    if @comment.save
      @post.save
      redirect_to :back
    else
      render @post
    end
  end
  
  private
    def set_post
      @post=Post.find(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:body)
    end
  
end
