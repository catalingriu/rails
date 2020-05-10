# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   # Game.create!({name: 'DOTA 4', platform_id: platforms[0].id, quantity: 1, loan_period: 1})
  # user = User.create! email: 'johnjohn@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', isadmin: 2
  platforms = Platform.create!([{name:'PQ'}, {name:'pw'}])
