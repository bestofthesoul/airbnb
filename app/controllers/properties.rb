
require_relative '../../config/environment'
enable :sessions

require 'byebug'



#VIEW BOOKINGS
get 'users/:id/bookings' do
@bookeduser = Book.find_by(bookeduser_id: params[:id])
erb :stats 
end


# CREATE NEW PROPERTIES

post '/users/:id/properties/create' do
	@user = User.find(params[:id])
	@property = Property.create(property: params["property"], user_id: params[:id])
	
	@tag = params[:tags]
	@tag.downcase!
	@taglist = @tag.split(",")
	@taglist.each{|x| x.gsub!(" ","")}
	@taglist.uniq!

	if @property.save
		if @taglist.empty?
			@msg ="No tag is added along created property"
		else
			@taglist.each do |tag|
				@property.tags << Tag.find_or_create_by(name:"#{tag}")
			# http://www.rubydoc.info/docs/rails/ActiveRecord/Relation:find_or_create_by
			end
		end
		
		redirect to "/users/#{@user.id}" #TO SEE THE WHOLE LIST OF PROPERTIES
	else
		@msg = "Invalid or empty property"
		redirect to "/users/#{@user.id}"
	end	
end

#READ - SHOW
get '/users/:id/properties/:property_id' do
	@user = User.find(params[:id])
	@property = Property.find(params[:property_id])

	@checkbook = Book.find_by(bookeduser_id: params[:id],bookedproperty_id: params[:property_id])

	# books belong to EACH property
	@book = Book.where(bookedproperty_id: params[:property_id]) 

	erb :"property/property_show"
end




# EDIT / UPDATE PROPERTY
get '/users/:id/properties/:property_id/edit' do
	@user = User.find(params[:id])
	@property = Property.find(params[:property_id])
	erb :"property/property_edit"
end

put '/users/:id/properties/:property_id/edit' do
	@user = User.find(params[:id])
	@property = Property.find(params[:property_id])
	@property.property = "#{params["property"]}"
	# @property.property.downcase!

	@tag = params[:tags]
	@tag.downcase!
	@taglist = @tag.split(",")
	@taglist.each{|x| x.gsub!(" ","")}
	@taglist.uniq!


	if @property.save
		if @taglist.empty?

		else
			@taglist.each do |tag|
				@property.tags << Tag.find_or_create_by(name:"#{tag}")
			# http://www.rubydoc.info/docs/rails/ActiveRecord/Relation:find_or_create_by
			end
		end
		
		redirect to "/users/#{@user.id}" #TO SEE THE WHOLE LIST OF PROPERTIES
	else
		@msg = "Invalid or empty property update"
		redirect to "/users/#{@user.id}"
	end
end


#DELETE PROPERTY
delete '/users/:id/properties/:property_id' do
	@user = User.find(params[:id])
 	@property = Property.find(params[:property_id])
	@property.destroy

	
	#---
	# @property.tags.destroy
  	
  	#---
  	redirect to "/users/#{@user.id}"
end	


#BOOK OR UNBOOK

post '/users/:id/properties/:property_id/book' do
	@book = Book.create(bookeduser_id: params[:id], bookedproperty_id: params[:property_id])
	redirect to "/users/#{@book.bookeduser_id}/properties/#{@book.bookedproperty_id}"
end

post'/users/:id/properties/:property_id/unbook' do
  @book = Book.find_by(bookedproperty_id: params[:property_id]) # find by property NOT by user
  @book.destroy
  redirect to "/users/#{@book.bookeduser_id}/properties/#{@book.bookedproperty_id}"
end




