class CreateProducts < ActiveRecord::Migration
  	def change
  		create_table :products do |t|
  			t.string :title
  			t.text :description
  			t.decimal :price
  			t.integer :size
  			t.boolean :spicy
  			t.boolean :veg
  			t.boolean :best_offer
  			t.string :image_path
        t.string :small_image_path

  			t.timestamps null: false
  		end
  	end
end
