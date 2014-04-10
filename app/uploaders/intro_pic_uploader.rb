# encoding: utf-8

class IntroPicUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/intro_pics"
  end
  
  process :resize_to_fill => [291, 192]

end
