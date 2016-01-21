class AddProducts < ActiveRecord::Migration
  	def change
  		Product.create( 
  			:title=> 'Hawaiian', 
  			:description=> 'This is Hawaiian pizza', 
  			:price=> 400, 
  			:size=> 30, 
  			:spicy=> false, 
  			:veg=> false, 
  			:best_offer=> false, 
  			:image_path=> './images/hawaiian.png'
        )

  		Product.create(
  			:title=> 'Margharita', 
  			:description=> 'Awesome Marghaarita pizza', 
  			:price=> 350, 
  			:size=> 30, 
  			:spicy=> false, 
  			:veg=> false, 
  			:best_offer=> true, 
  			:image_path=> './images/margarita.png'
        )

  		Product.create(
  			:title=> 'Pepperoni', 
  			:description=> 'Nice Pepperoni pizza', 
  			:price=> 450, 
  			:size=> 30, 
  			:spicy=> true, 
  			:veg=> false, 
  			:best_offer=> true, 
  			:image_path=> './images/pepperoni.png'
        )

  		Product.create( 
  			:title=> 'Vegetarian', 
  			:description=> 'Amazing Vegetarian pizza', 
  			:price=> 350, 
  			:size=> 30, 
  			:spicy=> false, 
  			:veg=> true, 
  			:best_offer=> false, 
  			:image_path=> './images/vegetarian.png'
        )
  	end
end
