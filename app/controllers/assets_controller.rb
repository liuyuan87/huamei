require "find"
class AssetsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def create
    @imgFile, @dir = params[:imgFile], params[:dir]
    case params[:model_type]
    when "index_pics"
      uploader_model = "IndexPicUploader"
    when "index_pics2"
      uploader_model = "IndexPicUploader2"
    when "intro_pics"
      uploader_model = "IntroPicUploader"
    when "case_pics"
      uploader_model = "CasePicUploader"
    when "night_item_covers"
      uploader_model = "NightItemCoverUploader"
    when "night_presenter_covers"
      uploader_model = "NightPresenterCoverUploader"
    when "magazine_covers"
      uploader_model = "MagazineCoverUploader"
    when "map"
      uploader_model = "MapUploader"
    else
      uploader_model = "AssetUploader"
    end
    unless @imgFile.nil?
      begin
        uploader = uploader_model.constantize.new
        uploader.store!(@imgFile)
        render :text => ({:error => 0, :url => uploader.url}.to_json)
      rescue CarrierWave::UploadError => e
        show_error(e.message)
      rescue Exception => e
        show_error(e.to_s)
      end
    else
      show_error("No File Selected!")
    end
  end
  
  def list
    upload_store_dir = "upload"
    
    @root_path = "#{Rails.public_path}/#{upload_store_dir}/"
    @root_url = "/#{upload_store_dir}/"
    
    @img_ext = Kindeditor::AssetUploader::EXT_NAMES[:image]
    @dir = params[:dir].strip || ""
    # unless Kindeditor::AssetUploader::EXT_NAMES.keys.map(&:to_s).push("").include?(@dir)
      # render :text => "Invalid Directory name."
      # return
    # end
    
    Dir.chdir(Rails.public_path)
    upload_store_dir.split('/').each do |dir|
      Dir.mkdir(dir) unless Dir.exist?(dir)
      Dir.chdir(dir)
    end
    
    Dir.mkdir(@dir) unless Dir.exist?(@dir)
    
    @root_path += @dir + "/"
    @root_url += @dir + "/"
    
    @path = params[:path].strip || ""
    if @path.empty?
      @current_path = @root_path
      @current_url = @root_url
      @current_dir_path = ""
      @moveup_dir_path = ""
    else
      @current_path = @root_path + @path + "/"      
      @current_url = @root_url + @path + "/"
      @current_dir_path = @path
      @moveup_dir_path = @current_dir_path.gsub(/(.*?)[^\/]+\/$/, "")
    end
    @order = %w(name size type).include?(params[:order].downcase) ? params[:order].downcase : "name"
    if !@current_path.match(/\.\./).nil?
      render :text => "Access is not allowed."
      return
    end
    if @current_path.match(/\/$/).nil?
      render :text => "Parameter is not valid."
      return
    end
    if !File.exist?(@current_path) || !File.directory?(@current_path)
      render :text => "Directory does not exist."
      return
    end
    @file_list = []
    Dir.foreach(@current_path) do |filename|  
      hash = {}
      if filename != "." and filename != ".." and filename != ".DS_Store"
        file = @current_path + filename
        if File.directory?(file)
          hash[:is_dir] = true
          hash[:has_file] = (Dir.foreach(file).count > 2)
          hash[:filesize] = 0
          hash[:is_photo] = false
          hash[:filetype] = ""
        else
          hash[:is_dir] = false
          hash[:has_file] = false
          hash[:filesize] = File.size(file)
          hash[:dir_path] = ""
          file_ext = file.gsub(/.*\./,"")
          hash[:is_photo] = @img_ext.include?(file_ext)
          hash[:filetype] = file_ext
        end
        hash[:filename] = filename
        hash[:datetime] = File.mtime(file).to_s(:db)
        @file_list << hash
      end
    end

    @file_list.sort! {|a, b| a["file#{@order}".to_sym] <=> b["file#{@order}".to_sym]}
    
    @result = {}
    @result[:moveup_dir_path] = @moveup_dir_path
    @result[:current_dir_path] = @current_dir_path
    @result[:current_url] = @current_url
    @result[:total_count] = @file_list.count
    @result[:file_list] = @file_list
    render :text => @result.to_json
  end  
  
 private
 
  def show_error(msg)
    render :text => ({:error => 1, :message => msg}.to_json)
  end
  
end
