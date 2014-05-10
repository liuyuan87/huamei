class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.text :content
      
      t.datetime :created_at
    end
  end
end
