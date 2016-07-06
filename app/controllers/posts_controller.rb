class PostsController < ApplicationController
  before_action :is_logged?, only:[:create,:destroy,:new]
  def new
    @post= Post.new  
  end
  
  def create
    @post=Post.create(post_params)
    if @post.save
      @user.posts<<@post
      @user.save
      redirect_to :back
    else
      render 'new'
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
    def post_params
      params.require(:post).permit(:title,:body,:category)
    end
    
    def is_logged?
      if session[:user_id]
        @user=User.find(:user_id)
      else
        redirect_to loggin_path
      end
    end
end
