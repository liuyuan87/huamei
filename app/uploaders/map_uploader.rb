# encoding: utf-8

class MapUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/map"
  end
  
  process :resize_to_fill => [833, 451]

end
