# encoding: utf-8

class CasePicUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/case_pics"
  end
  
  process :resize_to_fill => [291, 192]

end
