# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat_1 = Cat.create(birth_date: '2012-01-04',color: 'orange', name: 'Jhiskers',  sex: 'M', description: 'A cute Kitty')
cat_2 = Cat.create(birth_date: '2014-01-04',color: 'grey', name: 'Khiskers',  sex: 'F', description: 'A cute Kitty')
cat_3 = Cat.create(birth_date: '2015-12-04',color: 'black', name: 'Meow',  sex: 'M', description: 'A cute Kitty')
cat_4 = Cat.create(birth_date: '2010-04-04',color: 'black', name: 'Khiskers',  sex: 'F', description: 'A cute Kitty')          
cat_5 = Cat.create(birth_date: '2002-05-04',color: 'orange', name: 'Garfield',  sex: 'M', description: 'A cute Kitty')
cat_6 = Cat.create(birth_date: '2004-06-04',color: 'white', name: 'Kitty',  sex: 'F', description: 'A cute Kitty')
