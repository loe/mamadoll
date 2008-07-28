class PersonSweeper < ActionController::Caching::Sweeper
  observe Person

  def after_create(person)
    expire_cache_for(person)
  end

  def after_update(person)
    expire_cache_for(person)
  end

  def after_destroy(person)
    expire_cache_for(person)
  end

  private
  def expire_cache_for(record)
    expire_page(:controller => 'people', :action => 'index')
    expire_page(:controller => 'people', :action => 'show', :id => record.to_param)
  end
end