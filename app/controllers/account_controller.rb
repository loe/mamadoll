class AccountController < ApplicationController

  def index
    redirect_to :action => "login"
  end

  def login

    if request.get?    
      @page_title = "Login"

    elsif request.post?    

      if false
        session[:authenticated] = true
        redirect_to("/")
      else
        flash[:error] = "Incorrect password."
        @page_title = "Login"
      end
    end
  end

end
