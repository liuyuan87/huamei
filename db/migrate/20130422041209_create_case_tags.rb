class CreateCaseTags < ActiveRecord::Migration
  def change
    create_table :case_tags do |t|
      t.string :name
    end
  end
end
