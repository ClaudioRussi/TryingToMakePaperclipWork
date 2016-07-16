class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  before_action :is_loged?, only:[:messages,:edit,:show,:update]
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
  
  def edit
    @user=current_user
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password,:password_confirmation,:name,:email,:avatar)
    end
  
    def edit_params
      params.require(:user).permit(:password,:password_confirmation,:avatar)
    end
    
    def set_user
      @user=User.find(params[:id])
    end
  
    def current_user
      User.find(session[:user_id])  
    end
end