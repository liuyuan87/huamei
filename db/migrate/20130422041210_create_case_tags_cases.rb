class CreateCaseTagsCases < ActiveRecord::Migration
  def change
    create_table :case_tags_cases do |t|
      t.integer :case_tag_id
      t.integer :case_id
    end
  end
end
