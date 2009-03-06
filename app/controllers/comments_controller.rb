class CommentsController < ApplicationController
  
  before_filter :check_authorization, :except => [ :create ]
  
  # Add a comment
  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Your comment has been added.'
      redirect_to(:controller => 'episodes', :action => 'show', :id => params[:comment][:episode_id])
    end
  end
  
  # NUKE bad comments
  def nuke
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
      flash[:notice] = "Comment successfully NUKED."
      redirect_to(:controller => "episodes", :action => "show", :id => @comment.episode)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_to(:controller => "episodes", :action => "show", :id => @comment.episode)
    end
  end
end
