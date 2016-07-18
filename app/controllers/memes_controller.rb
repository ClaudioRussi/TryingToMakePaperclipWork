class MemesController < ApplicationController
  before_action :set_meme, only:[:show,:positive_vote,:negative_vote,:neutral_vote]
  def new
    @meme = Meme.new
  end
  
  def create
    @meme = Meme.new(meme_params)
    @meme.user_id=session[:user_id]
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render 'new'
    end
  end
  
  def show
    @comment=Comment.new
    @comments=Comment.where(meme_id: @meme.id)
  end
  
  def index
    memes=Meme.where(status: 'Accepted')
    @page=paginator(memes,params[:id])
    set_next_previous(memes,params[:id])
  end
  
  def vote
    @meme=Meme.find(params[:id])
    @meme.moderators << current_user
    @meme.vote+=params[:point].to_i
    @meme.vote_count+=1
    @meme.save
    
    redirect_to moderation_path
  end
  
  def moderation
    memes=[]
    memes_in_moderation = Meme.where(status: 'In Moderation')
    memes_in_moderation.each do |meme|
      unless current_user.moderated_memes.include?(meme)
        memes << meme
      end
    end
    @meme=memes.first
  end
  
  private
    def meme_params
      params.require(:meme).permit(:body,:title)
    end
  
   def set_meme
     @meme=Meme.find(params[:id])
   end

end
