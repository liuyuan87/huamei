# encoding: utf-8

class NightPresenterCoverUploader < AssetUploader
  
  include CarrierWave::MiniMagick
  
  def store_dir
    "upload/night_presenter_covers"
  end
  
  process :resize_to_fill => [288, 510]

end
