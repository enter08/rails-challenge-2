class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.boolean :active
      t.string :url
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
