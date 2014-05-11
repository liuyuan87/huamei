#encoding: utf-8
class NightCard < ActiveRecord::Base
  
  has_many :night_items
  
end
