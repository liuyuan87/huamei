class StartController < ApplicationController
  
  def index
    @index_pics = JSON.parse(SysSetting.find_by_stype("index_pics").setting)
    @index_pics2 = JSON.parse(SysSetting.find_by_stype("index_pics2").setting)
    @night_items = NightItem.all :order => "id desc", :limit => 8
  end
  
  def intro
    @intro = SysSetting.find_by_stype("intro").setting
    @intro_pics = JSON.parse(SysSetting.find_by_stype("intro_pics").setting)
    @topics = Topic.all :order => "id asc"
  end
  
  def intro_detail
    @topic = Topic.find_by_title(params[:id])
    if @topic.blank?
      redirect_to "/intro"
    else
      @title = @topic.title
    end
  end
  
  def case
    @cases = Case.paginate :page => params[:page], :per_page => 15, :order => "is_hot desc, id desc"
  end
  
  def case_tag
    @case_tag = CaseTag.find_by_name(params[:id])
    if !@case_tag.blank?
      @cases = @case_tag.cases.paginate :page => params[:page], :per_page => 15, :order => "is_hot desc, id desc"
    else
      @cases = []
    end
    render :case
  end
  
  def case_info
    @case = Case.find_by_title(params[:id])
    if @case.blank?
      redirect_to "/case"
    else
      @title = @case.title
    end
  end
  
  def night
    @intro = JSON.parse(SysSetting.find_by_stype("nights").setting)
    @night_presenters = NightPresenter.all :order => "id desc"
  end
  
  def magazine
    @magazines = Magazine.all :order => "id desc"
  end
  
  def magazine_detail
    @magazine = Magazine.find(params[:id])
    
    @rel_path = "/upload/magazine/" + @magazine.folder + "/imgs/"
    @current_path = "#{Rails.public_path}" + @rel_path
    
    @order = "name"
    
    if !File.exist?(@current_path) || !File.directory?(@current_path)
      render :text => "Directory does not exist."
      return
    end
    @file_list = []
    Dir.foreach(@current_path) do |filename|  
      hash = {}
      if filename != "." and filename != ".." and filename != ".DS_Store"
        file = @current_path + filename
        hash[:is_dir] = false
        hash[:has_file] = false
        hash[:filesize] = File.size(file)
        hash[:dir_path] = ""
        file_ext = file.gsub(/.*\./,"")
        hash[:filetype] = file_ext
        hash[:filename] = filename
        hash[:datetime] = File.mtime(file).to_s(:db)
        @file_list << hash
      end
    end

    @file_list.sort! {|a, b| a["file#{@order}".to_sym] <=> b["file#{@order}".to_sym]}
  end
  
  def contact
    @contact = JSON.parse(SysSetting.find_by_stype("contact").setting)
  end
  
  def not_supported
    render :layout => false
  end
  
end
