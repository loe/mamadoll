class PagesController < ApplicationController
  
  before_filter :check_authorization, :except => [ :index, :show ]
  
  def index
    @pages = Page.find(:all, :order => "title DESC")
    @page_title = "Pages"
  end
  
  def new
    @page_title = "New Page"
  end
  
  def create
    @page = Page.new(params[:page])
    
    if @page.save
      flash[:notice] = "Page successfully created."
      redirect_to :action => "show", :id => @page.to_param
    else
      flash.now[:error] = @page.errors.full_messages.to_sentence
      render :action => "new"
    end
  end
  
  def edit
    @page = Page.find_by_permalink(params[:id])
    @page_title = "Edit: " + @page.title
  end
  
  def update
    @page = Page.find_by_permalink(params[:id])
    
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page succesfully edited."
      redirect_to :action => "show", :id => @page.to_param
    else
      flash.now[:error] = @page.errors.full_messages.to_sentence
      render :action => "edit", :id => @page.to_param
    end
  end
  
  def show
    @page = Page.find_by_permalink(params[:id])
    @page_title = @page.title
  end
  
end
