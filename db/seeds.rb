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


d1 = Destination.create(name: "McDonald Observatory", city: "Fort Davis", state: "Texas", country: "United States", picture_link: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fnews.rice.edu%2Ffiles%2F2016%2F05%2F0525_PLANET-UTMcD-233-lg-15kwd14.jpg&f=1&nofb=1")
d2 = Destination.create(name: "Big Bend", city: "Big Bend National Park", state: "Texas", country: "United States", picture_link: "https://www.nps.gov/bibe/planyourvisit/images/maverick-sign.jpg")

e1 = Event.create(name: "Star Party", price: 100, destination_id: d1.id)
e2 = Event.create(name: "Tour", price: 20, destination_id: d1.id)
e3 = Event.create(name: "Horseback Riding", price: 50, destination_id: d2.id)
e4 = Event.create(name: "Hiking", price: 0, destination_id: d2.id)

50.times {
  Country.create(name: Faker::Address.country)
}
100.times {
  State.create(
    name: Faker::Address.country,
    country: Country.all[rand(1..50)]
    )
}
100.times {
  City.create(
    name: Faker::Address.country,
    state: State.all([])
    )
}



1000.times {
  Destination.create(
    name: Faker::Restaurant.name, 
    city: Faker::Address.city, 
    state: Faker::Address.state, 
    country: Faker::Address.country,
    picture_link: Faker::LoremFlickr.image(search_terms: ['restaurant'])
  )
}

100.times {
  Review.create(
    rating: rand(0..10),
    content: Faker::Restaurant.review,
    user_id: 3,
    destination_id: Destination.all[rand(1..1000)].id
  )
}
