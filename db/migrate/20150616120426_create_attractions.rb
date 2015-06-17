class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :opening_hour
      t.string :duration
      t.string :reservation
      t.text :more_info
      t.text :picture
      t.text :url
      t.integer :category_id
      t.integer :region_id
      t.integer :variety_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
