class CreateNightPresenters < ActiveRecord::Migration
  def change
    create_table :night_presenters do |t|
      t.string :name
      t.string :cover
      t.string :weibo
      t.text :info
      
      t.datetime :created_at
    end
  end
end
