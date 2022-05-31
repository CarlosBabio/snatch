class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :category
      t.integer :engine_size
      t.string :features, array: true
      t.string :additional_info
      t.string :license_plate
      t.float :price_per_day
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
