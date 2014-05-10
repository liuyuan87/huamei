#encoding: utf-8
class CreateCaseTags < ActiveRecord::Migration
  def change
    create_table :case_tags do |t|
      t.string :name
    end
    
    ["品牌包装", "影视制作与发布", "广告制作与投放", "杂志出版与印刷", "公关活动策划", "创意产品制造"].each do |tag|
      CaseTag.create(:name => tag)
    end
  end
end
