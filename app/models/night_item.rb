#encoding: utf-8
class NightItem < ActiveRecord::Base
    
  mount_uploader :play_addr, NightItemUploader

  belongs_to :night_card
  
end
