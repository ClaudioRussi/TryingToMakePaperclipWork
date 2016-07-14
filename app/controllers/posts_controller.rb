class PostsController < ApplicationController
  before_action :is_logged?, only:[:create,:destroy,:new]
  before_action :set_post, only:[:show]
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
  end
  
  def show
    @comments=@post.comments
    @comment=Comment.new
    
  end
  
  def missing
    
  end
  def adoption
    
  end
  def found
    
  end
  private
    def post_params
      params.require(:post).permit(:title,:body,:category,:cover)
    end
    
    def is_logged?
      if session[:user_id]
        @user=User.find(session[:user_id])
      else
        redirect_to root_path
      end
    end
    
    def set_post
      @post=Post.where(id: params[:id]).last
    end
end
