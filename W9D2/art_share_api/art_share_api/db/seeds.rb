# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

artist_1 = User.create(username: 'Van Gough')
artist_2 = User.create(username: 'Monet')
artist_3 = User.create(username: 'Grant Wood')
artist_4 = User.create(username: 'Leonardo Da Vinci')

user_5 = User.create(username: 'Campbell')
user_6 = User.create(username: 'Robert')
user_7 = User.create(username: 'Sergey')
user_8 = User.create(username: 'Mashu')

artwork_1 = Artwork.create!(title: 'Mona Lisa', image_url: 'www.google.com/images/artwork1', artist_id: artist_4.id)
artwork_2 = Artwork.create!(title: 'The Starry Night', image_url: 'www.google.com/images/artwork2', artist_id: artist_1.id)
artwork_3 = Artwork.create!(title: 'The Last Supper', image_url: 'www.google.com/images/artwork3', artist_id: artist_4.id)
artwork_4 = Artwork.create!(title: 'Poppies', image_url: 'www.google.com/images/artwork4', artist_id: artist_2.id)
artwork_5 = Artwork.create!(title: 'American Gothic', image_url: 'www.google.com/images/artwork5', artist_id: artist_3.id)

share_1 = ArtworkShare.create(artwork_id: artwork_1.id, viewer_id: user_8.id)
share_2 = ArtworkShare.create(artwork_id: artwork_2.id, viewer_id: user_7.id)
share_3 = ArtworkShare.create(artwork_id: artwork_3.id, viewer_id: user_5.id)
share_4 = ArtworkShare.create(artwork_id: artwork_4.id, viewer_id: user_6.id)
share_5 = ArtworkShare.create(artwork_id: artwork_5.id, viewer_id: user_6.id)