class CreateNightItems < ActiveRecord::Migration
  def change
    create_table :night_items do |t|
      t.integer :night_card_id
      t.string :title
      t.string :cover
      t.string :play_addr
      
      t.datetime :created_at
    end
  end
end
