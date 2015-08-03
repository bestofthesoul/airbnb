

class CreatePropertytags < ActiveRecord::Migration
  def change

    create_table  :propertytags do |x|
	x.integer :property_id
	x.integer :tag_id

      x.timestamps  null: false
    end
  end
end
