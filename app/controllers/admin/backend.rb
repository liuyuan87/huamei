class Admin::Backend < ApplicationController
  
  layout 'backend'
  
  before_action :check_login
  
  def check_login
    if !session[:admin]
      redirect_to "/"
    end
  end
  
end
