# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


geordi = User.create!(name: "Geordi Laforge", email: "wassupitsgeordi@enterprise.com")
geordi.update(api_key: 'geordisapikey')

shania = User.create!(name: 'Shania Twain', email: 'thechicken@notthesinger.com')
shania.update(api_key: 'shaniasapikey')

shania.favorites.create!(country: 'yes please', recipe_link: 'www.grits.com', recipe_title: "Shania's Grits")
shania.favorites.create!(country: 'US of A', recipe_link: 'www.chicken-scratch.com', recipe_title: 'Scratch for Your Chickens')
shania.favorites.create!(country: 'Zaire', recipe_link: 'www.halloween-recipes.com', recipe_title: 'Left-over Jack-O-Lanterns')

sad_boy = User.create!(name: 'Sad Boi George', email: 'ihavenofavorites@recipes.com')
sad_boy.update(api_key: 'thesaddestkeyever')