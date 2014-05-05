class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.string :pic
      # t.string :intro
      t.text :content
      t.integer :is_hot, :default => 0
      
      t.datetime :created_at
    end
  end
end
