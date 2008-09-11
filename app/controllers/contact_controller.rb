class ContactController < ApplicationController

  def index
    @page_title = "Contact Us"
    render(:action => 'new')
  end
  
  def new
    @page_title = "Contact Us"
  end
  
  def create    
    if ContactMailer.deliver_message(params[:contact])
      flash[:notice] = "Thank you for your message!"
      render(:action => 'new')
    else
      flash.now[:error] = 'We were unable to deliver your message, please try again.'
      render(:action => 'new')
    end
  end
end
