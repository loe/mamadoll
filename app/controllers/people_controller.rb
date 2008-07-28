class PeopleController < ApplicationController
  
  before_filter :check_authorization, :except => [ :index, :show ]
  
  def index
    @people = Person.find(:all, :order => "name ASC")
    @page_title = "The People"
  end
  
  def new
    @page_title = "New Person"
  end
  
  def create
    @person = Person.new(params[:person])
    
    if @person.save
      flash[:notice] = "Person successfully created."
      redirect_to :action => "show", :id => @person.to_param
    else
      flash.now[:error] = @person.errors.full_messages.to_sentence
      render :action => "new"
    end
  end
  
  def edit
    @person = Person.find_by_permalink(params[:id])
    @page_title = "Edit: " + @person.name
  end
  
  def update
    @person = Person.find_by_permalink(params[:id])
    
    if @person.update_attributes(params[:person])
      flash[:notice] = "Person succesfully edited."
      redirect_to :action => "show", :id => @person.to_param
    else
      flash.now[:error] = @person.errors.full_messages.to_sentence
      render :action => "edit", :id => @person.to_param
    end
  end
  
  def show
    @person = Person.find_by_permalink(params[:id])
    @page_title = @person.name
  end
  
end
