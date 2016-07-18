class PostsController < ApplicationController
  before_action :is_loged?, only:[:create,:destroy,:new]
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
    posts=Post.order_by_category('Missing').order(created_at: :desc)
    @page=paginator(posts,params[:id])
    set_next_previous(posts,params[:id])
    render 'list'
    
  end
  
  def adoption
    posts=Post.order_by_category('Adoption').order(created_at: :desc)
    @page=paginator(posts,params[:id])
    set_next_previous(posts,params[:id])
    render 'list'
    
  end
  
  def found
    posts=Post.order_by_category('Found').order(created_at: :desc)
    @page= paginator(posts,params[:id])
    set_next_previous(posts,params[:id])
    render 'list'
    
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title,:body,:category,:cover)
    end
    
    def set_post
      @post=Post.where(id: params[:id]).last
    end
  
    
end
