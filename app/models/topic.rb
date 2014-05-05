class Topic < ActiveRecord::Base
  
  def show_url
    "/intro/#{self.title}"
  end

end
