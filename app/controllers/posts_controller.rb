class PostsController < ApplicationController
  before_action :is_logged?, only:[:create,:destroy]
  before_action :set_post, only:[:adoption,:missing,:found]
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
  
  def adoption
    render 'show'
  end
  
  def missing
    render 'show'
  end
  
  def found
    render 'show'
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
    
    def set_post
      @post=Post.where(id: params[:id]).last
    end
end
