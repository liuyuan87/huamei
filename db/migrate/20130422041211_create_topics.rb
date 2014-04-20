class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :intro
      t.text :content
      
      t.datetime :created_at
    end
  end
end
