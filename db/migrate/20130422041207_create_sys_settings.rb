class CreateSysSettings < ActiveRecord::Migration
  def change
    create_table :sys_settings do |t|
      t.string :stype
      t.text :setting
    end
        
    SysSetting.create(:stype => "index_pics", :setting => '{}')
    SysSetting.create(:stype => "intro_pics", :setting => '{}')
    SysSetting.create(:stype => "intro", :setting => '')
  end
end
