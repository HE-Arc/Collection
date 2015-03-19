# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


back_in_black_tracks = Track.create([{title: "Hells Bells", track_number: 1}, {title: "Shoot to Thrill", track_number: 2}, {title: "What Do You Do For Money Honey", track_number: 3}, {title: "Givin The Dog A Bone", track_number: 4}])
Cd.create({artist: "AC/DC", name: "Back in Black", editor: "Compass Point Studio", cover: "backinblack.jpg", purchaseDate: "2013-01-22", description: "J'ai acheté cet album en souvenir du bon vieux temps", tracks: back_in_black_tracks})

and_justice_for_all_tracks = Track.create([{title: "Blackened", track_number: 1}, {title: "...And Justice for All", track_number: 2}, {title: "Eye of the Beholder", track_number: 3}, {title: "One", track_number: 4}, {title: "The Shortest Straw", track_number: 5}])
Cd.create({artist: "Metallica", name: "...And Justice for All (Deluxe Edition)", editor: "Elektra Records", cover: "andjusticeforall.jpg", purchaseDate: "1995-04-24", description: "Acheté dans une boutique louche en Argovie", tracks: and_justice_for_all_tracks})
