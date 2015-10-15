# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

wynne = User.create(email: "wynnemlo@gmail.com", full_name: "Wynne Lo", password: "candy123")

Category.create(name: "Computer")
Category.create(name: "Gadgets")
Category.create(name: "Appliances")

Fabricate(:item, user: wynne, category_id: 1)
Fabricate(:item, user: wynne, category_id: 1)
Fabricate(:item, user: wynne, category_id: 2)
Fabricate(:item, user: wynne, category_id: 2)
Fabricate(:item, user: wynne, category_id: 3)
Fabricate(:item, user: wynne, category_id: 3)



