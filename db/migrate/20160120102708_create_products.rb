class CreateProducts < ActiveRecord::Migration
  	def change
  		create_table :Products do |t|
  			t.string :title
  			t.text :description
  			t.decimal :price
  			t.integer :size
  			t.boolean :spicy
  			t.boolean :veg
  			t.boolean :best_offer
  			t.string :image_path

  			t.timestamps null: false
  		end
  	end
end