class CreateNightCards < ActiveRecord::Migration
  def change
    create_table :night_cards do |t|
      t.string :title
      
      t.datetime :created_at
    end
  end
end
