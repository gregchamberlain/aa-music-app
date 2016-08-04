# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  band = Band.create(name: Faker::Team.name)
  5.times do
    album = Album.create(name: Faker::Book.title, band_id: band.id, kind: "studio")
    5.times do
      Track.create(name: Faker::Book.title, album_id: album.id, kind: "regular", lyrics: Faker::Lorem.paragraph)
    end
  end
end
