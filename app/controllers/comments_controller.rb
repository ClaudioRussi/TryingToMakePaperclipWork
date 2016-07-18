class CommentsController < ApplicationController
  before_action :set_commentable, only:[:new,:create]
  
  def create
    @comment= @commentable.comments.new(comment_params)
    @comment.user_id=session[:user_id]
    if @comment.save
      redirect_to :back
    else
      render @commentable
    end
  end
  
  private
    def set_commentable
      if Post.where(id: params[:post_id]).any?
        @commentable=Post.find(params[:post_id])
      else
        @commentable=Meme.find(params[:meme_id])
      end
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  
end
