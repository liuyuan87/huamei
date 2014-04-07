class StartController < ApplicationController
  
  def index
    
  end
  
  def not_supported
    render :layout => false
  end
  
end
