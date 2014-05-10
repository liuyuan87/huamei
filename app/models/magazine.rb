class Magazine < ActiveRecord::Base
  
  mount_uploader :zip, MagazineImgsUploader
  
  def show_url
    "magazine/#{self.id}"
  end
  
end
