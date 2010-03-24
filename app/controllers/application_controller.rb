# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_mamadoll_session_id'
  
  # lists for the navigation
  helper_method :episode_list
  def episode_list
    @episode_list = Episode.find(:all, :order => "id DESC")
  end
  
  helper_method :people_list
  def people_list
    @people_list = Person.find(:all, :order => "name ASC")
  end
  
  helper_method :page_list
  def page_list
    @page_list = Page.find(:all, :order => "id ASC")
  end
  
  # Allows pages to be cached by Varnish for up to 1 hour.
  def set_cache_control
    expires_in(1.hour, :public => true)
  end
  
  # authorization
  helper_method :check_authorization
  def check_authorization
    if session[:authenticated] == true
      true
    else
      flash[:error] = "Please Authenticate"
      redirect_to :controller => "account", :action => "login"
    end
  end
  
end