class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
    def paginator(element_list,page_id)
      if page_id.to_i!=0
        page_id=page_id.to_i
        element_per_page=10
        element_list[(page_id-1)*element_per_page..(page_id)*element_per_page-1]
      else
        nil
      end
    end
    def is_loged?
        if session[:user_id]
          @user=User.find(session[:user_id])
        else
          redirect_to root_path
        end
    end
  
    def current_user
      User.find(session[:user_id])  
    end

    def set_next_previous(list,id)
      if paginator(list,id.to_i+1) and paginator(list,id.to_i-1)
        @next_page=id.to_i+1
        @previous_page=id.to_i-1
      elsif paginator(list,id.to_i+1)
        @next_page=id.to_i+1
        @previous_page=nil
      elsif paginator(list,id.to_i-1)
        @previous_page=id.to_i-1
        @next_page=nil
      else
        @previous_page=nil
        @next_page=nil
      end
   end

end
