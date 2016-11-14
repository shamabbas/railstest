# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p 'Removing all owners'
Owner.destroy_all

p 'Creating owner'
Owner.create(name: "James")
first_owner = Owner.first

p 'Creating another owner'
Owner.create(name: "Michal")
last_owner = Owner.last

p 'Removing all previous articles'
Article.destroy_all

p "Creating articles for #{first_owner.name}"
1.upto(3) do |i|
  Article.create(name: "Test article- #{i}", price: (1+i).to_f,  description: "test description for article- #{i}",
                 owner_id: first_owner.id)
end


p "Creating articles for #{last_owner.name}"
1.upto(3) do |i|
  Article.create(name: "Web app article- #{i}", price: (2+i).to_f,  description: "test description for article- #{i}",
                 owner_id: last_owner.id)
end