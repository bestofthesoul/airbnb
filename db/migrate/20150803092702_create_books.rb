class CreateBooks < ActiveRecord::Migration
  def change

    create_table  :books do |x|
		x.integer :user_id
		x.integer :property_id
		x.timestamps  null: false
    end
    
  end
end
