# encoding: utf-8

class MagazineCoverUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/magazine_covers"
  end
  
  process :resize_to_fill => [427, 580]

end
