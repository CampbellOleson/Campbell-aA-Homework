# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user_1 = User.create(email: 'spoofmail1@gmail.com', password: 'hunter1')
user_2 = User.create(email: 'spoofmail2@gmail.com', password: 'hunter2')
user_3 = User.create(email: 'spoofmail3@gmail.com', password: 'hunter3')
user_4 = User.create(email: 'spoofmail4@gmail.com', password: 'hunter4')
user_5 = User.create(email: 'spoofmail5@gmail.com', password: 'hunter5')
user_6 = User.create(email: 'spoofmail6@gmail.com', password: 'hunter6')
user_7 = User.create(email: 'spoofmail7@gmail.com', password: 'hunter7')
user_8 = User.create(email: 'spoofmail8@gmail.com', password: 'hunter8')
user_9 = User.create(email: 'spoofmail9@gmail.com', password: 'hunter9')
user_10 = User.create(email: 'spoofmail10@gmail.com', password: 'hunter10')

