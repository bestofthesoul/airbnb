
class CreateBookedusers < ActiveRecord::Migration
  def change

    create_table  :bookedusers do |x|
		x.string  :email
		x.string  :password
		x.timestamps  null: false
    end
    
  end
end

