# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'john@gm.com', password: 'testtest', firstname: "John", lastname: "Connor")
User.create!(email: 'test2@op.pl', password: 'testtest', firstname: "Andree", lastname: "Mone")
User.create!(email: 'test3@op.pl', password: 'testtest', firstname: "Ben", lastname: "Ten")
User.create!(email: 'test4@op.pl', password: 'testtest', firstname: "Steven", lastname: "Kowalski")
User.create!(email: 'test5@op.pl', password: 'testtest', firstname: "Jack", lastname: "Smith")
User.create!(email: 'admin@gm.pl', password: 'testtest', firstname: "Neo", lastname: "Anderson", admin: true)

Category.create!([{name: 'Fruits'}, { name: 'Movies' }, { name: 'Software' }, { name: 'Cars' }])


user = User.find_by(email: 'john@gm.com')
food = Category.find_by(name: 'Fruits')
food.products.create!(title: 'Apple', description: 'Good polish apples', price: 3.33, user_id: user.id)
food.products.create!(title: 'Bannas', description: 'Made in Chiquita', price: 4.23, user_id: user.id)
food.products.create!(title: 'Merci', description: 'Christmas edition', price: 14.31, user_id: user.id)
food.products.create!(title: 'Goralki', description: 'Sweet like a honey', price: 5.99, user_id: user.id)
food.products.create!(title: 'Milk', description: 'Excelent 3,2% milk from Nowy Tomyśl ', price:3.5, user_id: user.id )

apple = Product.find_by(title: 'Apple')
apple.reviews.create!(content: 'Good apple', rating: 5, user_id: user.id)
apple.reviews.create!(content: 'Like it', rating: 5, user_id: user.id)
apple.reviews.create!(content: 'Sweet', rating: 4, user_id: user.id)
apple.reviews.create!(content: ':)', rating: 4, user_id: user.id)






