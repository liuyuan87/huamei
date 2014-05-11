class Admin::SysController < Admin::Backend
  
  def index_pics
    @sys_setting = SysSetting.find_by_stype("index_pics")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting][:setting].to_json
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "index_pics"
        @sys_setting.setting = "{}"
        @sys_setting.save
      end
    end
    @setting = JSON.parse(@sys_setting.setting)
  end
  
  def index_pics2
    @sys_setting = SysSetting.find_by_stype("index_pics2")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting][:setting].to_json
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "index_pics2"
        @sys_setting.setting = "{}"
        @sys_setting.save
      end
    end
    @setting = JSON.parse(@sys_setting.setting)
  end
  
  def intro_pics
    @sys_setting = SysSetting.find_by_stype("intro_pics")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting][:setting].to_json
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "intro_pics"
        @sys_setting.setting = "{}"
        @sys_setting.save
      end
    end
    @setting = JSON.parse(@sys_setting.setting)
  end
  
  def intro
    @sys_setting = SysSetting.find_by_stype("intro")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting]
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "intro"
        @sys_setting.setting = ""
        @sys_setting.save
      end
    end
    @setting = @sys_setting.setting
  end
  
  def nights
    @sys_setting = SysSetting.find_by_stype("nights")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting][:setting].to_json
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "nights"
        @sys_setting.setting = "{}"
        @sys_setting.save
      end
    end
    @setting = JSON.parse(@sys_setting.setting)
  end
  
  def contact
    @sys_setting = SysSetting.find_by_stype("contact")
    case request.method
    when "POST"
      @sys_setting.setting = params[:sys_setting][:setting].to_json
      @sys_setting.save
      @result = "OK"
    else
      if @sys_setting.nil?
        @sys_setting = SysSetting.new
        @sys_setting.stype = "contact"
        @sys_setting.setting = "{}"
        @sys_setting.save
      end
    end
    @setting = JSON.parse(@sys_setting.setting)
  end
  
end
