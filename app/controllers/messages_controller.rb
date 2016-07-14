class MessagesController < ApplicationController
  def new
    @message=Message.new()
    @recipent_id=params[:id]
  end
  
  def create
    @message = Message.new(message_params)
    @message.sender = User.find(session[:user_id])
    if @message.save
      redirect_to :back
    else
      render 'new'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:body,:recipent_id)
  end
  
end
