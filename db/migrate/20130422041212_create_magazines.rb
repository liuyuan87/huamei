class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.string :cover
      t.string :folder
      t.string :zip
      
      t.datetime :created_at
    end
  end
end
