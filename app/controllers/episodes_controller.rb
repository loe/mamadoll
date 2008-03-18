class EpisodesController < ApplicationController
  
  before_filter :check_authorization, :except => [ :index, :show, :latest ]
  
  def index
    @episodes = Episode.find(:all, :order => "id DESC")
    @page_title = "The Episodes"
  end
  
  def new
    @people = Person.find(:all, :order => "name ASC")
    @page_title = "New Episode"
  end
  
  def create
    @episode = Episode.new(params[:episode])
    
    # need to have an empty array if people at a minimum
    params[:people] ||= []
    
    # cycle through each person and add an appearance entry for them
    params[:people].each do |p|
      appearance = Appearance.new
      appearance.episode_id = @episode.id
      appearance.person_id = p
      
      appearance.save!
    end
    
    if @episode.save
      flash[:notice] = "Episode successfully created."
      redirect_to :action => "show", :id => @episode.to_param
    else
      flash.now[:error] = @episode.errors.full_messages.to_sentence
      render :action => "new"
    end
  end
  
  def edit
    @episode = Episode.find(params[:id])
    @people = Person.find(:all, :order => "name ASC")
    @page_title = "Edit: " + @episode.title
  end
  
  def update
    @episode = Episode.find(params[:id])
    
    # make sure we have arrays, even if they're empty
    params[:people] ||= []
    
    # cycle through the rights checkboxes and add the appropriate relationships
    params[:people].each do |p|
      appearance = Appearance.new
      appearance.episode_id = @episode.id
      appearance.person_id = p
      
      appearance.save!
    end
        
    if @episode.update_attributes(params[:episode])
      flash[:notice] = "Episode succesfully edited."
      redirect_to :action => "show", :id => @episode.to_param
    else
      flash.now[:error] = @episode.errors.full_messages.to_sentence
      render :action => "edit", :id => @episode.to_param
    end
  end
  
  def show
    @episode = Episode.find(params[:id])
    @page_title = @episode.title
  end
  
  def latest
    @episode = Episode.find(:first, :order => "id DESC")
    @page_title = @episode.title
    render :action => "show"
  end
  
end
