module ApplicationHelper
  def loged?
    session[:user_id]
  end
end
