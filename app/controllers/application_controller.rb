class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
    def paginator(element_list,page_id)
        page_id=page_id.to_i
        element_per_page=10
        element_list[(page_id-1)*element_per_page..(page_id)*element_per_page]
    end
    def is_loged?
        if session[:user_id]
          @user=User.find(session[:user_id])
        else
          redirect_to root_path
        end
    end
end
