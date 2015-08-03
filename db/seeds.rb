

tag1 = Tag.create(name: "hotel")
tag2 = Tag.create(name: "backpacker")
tag3 = Tag.create(name: "condo")


property1 = Property.create(property: "a")
property2 = Property.create(property: "b")
property3 = Property.create(property: "c")



Propertytag.create(property_id: property1.id , tag_id: tag1.id)
Propertytag.create(property_id: property2.id , tag_id: tag2.id)
Propertytag.create(property_id: property3.id , tag_id: tag3.id)







