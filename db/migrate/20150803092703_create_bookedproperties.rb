

class CreateBookedproperties < ActiveRecord::Migration
  def change

    create_table  :bookedproperties do |x|
      x.integer  :bookeduser_id
      x.string  :bookedproperty
      x.timestamps  null: false
    end
    
  end
end
