# geordi = User.create!(name: "Geordi Laforge", email: "wassupitsgeordi@enterprise.com", password: 'password', password_confirmation: 'password')
# geordi.update(api_key: 'geordisapikey')

# shania = User.create!(name: 'Shania Twain', email: 'thechicken@notthesinger.com', password: 'password', password_confirmation: 'password')
# shania.update(api_key: 'shaniasapikey')

# shania.favorites.create!(country: 'yes please', recipe_link: 'www.grits.com', recipe_title: "Shania's Grits")
# shania.favorites.create!(country: 'US of A', recipe_link: 'www.chicken-scratch.com', recipe_title: 'Scratch for Your Chickens')
# shania.favorites.create!(country: 'Zaire', recipe_link: 'www.halloween-recipes.com', recipe_title: 'Left-over Jack-O-Lanterns')

# sad_boy = User.create!(name: 'Sad Boi George', email: 'ihavenofavorites@recipes.com', password: 'password', password_confirmation: 'password')
# sad_boy.update(api_key: 'thesaddestkeyever')

guest = User.create!(name: 'Guest', email: 'guest@gmail.com', password: 'password', password_confirmation: 'password')
guest.update(api_key: 'guest_api_key')