# encoding: utf-8

class IndexPicUploader2 < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/index_pics2"
  end
  
  process :resize_to_fill => [246, 294]

end
