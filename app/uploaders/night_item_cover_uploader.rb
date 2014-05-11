# encoding: utf-8

class NightItemCoverUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/night_item_covers"
  end
  
  process :resize_to_fill => [300, 300]

end
