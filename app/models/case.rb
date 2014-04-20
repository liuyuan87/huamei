#encoding: utf-8
class Case < ActiveRecord::Base
  
  has_and_belongs_to_many :case_tags
  
  def tags
    self.case_tags.map{|t|t.name}.join(",")
  end
  
  def save_tags(tags)
    self.case_tags = []
    tags = tags.gsub(/，/, ',').split(',')
    tags.each do |t|
      tag = CaseTag.find_by_name(t)
      if tag.nil?
        tag = CaseTag.new
        tag.name = t
        tag.save
      end
      self.case_tags << tag
    end
  end

end
