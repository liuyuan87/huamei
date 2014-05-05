class StartController < ApplicationController
  
  def index
    @index_pics = JSON.parse(SysSetting.find_by_stype("index_pics").setting)
    @index_pics2 = JSON.parse(SysSetting.find_by_stype("index_pics2").setting)
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
    end
  end
  
  def case
    @cases = Case.all :order => "is_hot desc, id desc"
  end
  
  def case_info
    @case = Case.find_by_title(params[:id])
    if @case.blank?
      redirect_to "/case"
    end
  end
  
  def not_supported
    render :layout => false
  end
  
end
