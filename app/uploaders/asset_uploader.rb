# encoding: utf-8

class AssetUploader < CarrierWave::Uploader::Base
  
  storage :file
  # storage :fog
  
  def store_dir
    "upload"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :resize_to_fill => [200, 300]
  #
  # def scale(width, height)
    # # do something
  # end

  # Create different versions of your uploaded files:
  # version :small do
    # process :resize_to_fill => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  # store! nil's the cache_id after it finishes so we need to remember it for deletition
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(cache_dir, @cache_id_was))
    end
  end

  def filename
    if original_filename 
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path)).slice(0, 12)
      "#{@name}.#{file.extension}"
    end
  end
  
  # def extension_white_list
    # %w(jpg jpeg png gif tiff)
  # end

end
