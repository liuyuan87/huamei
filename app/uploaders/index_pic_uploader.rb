# encoding: utf-8

class IndexPicUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/index_pics"
  end
  
  process :resize_to_fill => [764, 600]

end
