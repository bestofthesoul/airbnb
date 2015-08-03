class CreateBooks < ActiveRecord::Migration
  def change

    create_table  :books do |x|
		x.integer :bookeduser_id
		x.integer :bookedproperty_id
		x.timestamps  null: false
    end
    
  end
end
