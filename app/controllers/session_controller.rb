class SessionController < ApplicationController
  def login
    user = User.find_by_email(params[:email])
    if user and user.athenticate(params[:password])
      session[:user_id]=user.id
    end
    redirect_to :back
  end
  
  def logout
    session[:user_id]=nil
  end
end
