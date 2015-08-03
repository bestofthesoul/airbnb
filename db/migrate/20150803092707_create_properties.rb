

class CreateProperties < ActiveRecord::Migration
  def change

    create_table  :properties do |x|
      x.integer  :user_id
      x.string  :property
      x.timestamps  null: false
    end
    
  end
end
