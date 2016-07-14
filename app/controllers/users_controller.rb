class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end    
  end
  
  def show
    
  end
  
  def messages
    @user= current_user
    @sent_msgs=Message.where(sender_id:@user.id)
    @received_msgs=Message.where(recipent_id:@user.id)
  end
  
  private
    def user_params
      params.require(:user).permit(:password,:password_confirmation,:name,:email,:avatar)
    end
    
    def set_user
      @user=User.find(params[:id])
    end
  
    def current_user
      User.find(session[:user_id])  
    end
end