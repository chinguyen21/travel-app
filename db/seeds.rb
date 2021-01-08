# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Destination.destroy_all
Event.destroy_all
Entry.destroy_all
Itinerary.destroy_all
Favorite.destroy_all
Review.destroy_all
Country.destroy_all
State.destroy_all
City.destroy_all


50.times {
  Country.create(name: Faker::Address.unique.country)
}
100.times {
  State.create(
    name: Faker::Address.state,
    country: Country.all[rand(1..40)]
    )
}
200.times {
  City.create(
    name: Faker::Address.unique.city,
    state: State.all[rand(1..80)]
    )
}

300.times {
  Destination.create(
    name: Faker::Restaurant.name, 
    city: City.all[rand(1..100)],
    picture_link: Faker::LoremFlickr.image(search_terms: ['restaurant'])
  )
}

300.times {
  Destination.create(
    name: Faker::Mountain.name, 
    city: City.all[rand(1..100)],
    picture_link: Faker::LoremFlickr.image(search_terms: ['mountain'])
  )
}

1000.times {
  Event.create(
    name: Faker::Games::StreetFighter.quote,
    price: rand(1..100),
    destination_id: Destination.all[rand(1..300)].id
  )
}

100.times {
  Review.create(
    rating: rand(0..10),
    content: Faker::Restaurant.review,
    user_id: 1,
    destination_id: Destination.all[rand(1..300)].id
  )
}
