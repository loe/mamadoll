class EpisodeSweeper < ActionController::Caching::Sweeper
  observe Episode

  def after_create(episode)
    expire_cache_for(episode)
  end

  def after_update(episode)
    expire_cache_for(episode)
  end

  def after_destroy(episode)
    expire_cache_for(episode)
  end

  private
  def expire_cache_for(record)
    expire_page(:controller => 'episodes', :action => 'index')
    expire_page(:controller => 'episodes', :action => 'latest') # root url
    expire_page(:controller => 'episodes', :action => 'show', :id => record.to_param)
  end
end