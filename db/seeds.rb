# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   # Game.create!({name: 'DOTA 4', platform_id: platforms[0].id, quantity: 1, loan_period: 1})
  user = User.create! email: 'johnjohn@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', isadmin: 2
  platforms = Platform.create!([{name:'PC'}, {name:'PS'}, {name: 'Xbox'}])

  games = Game.creat!([
     {name: "Grand Theft Auto V", quantity: 997, year: 2013, trailer: "VjZ5tgjPVfU", loan_period: 5, platform: platforms[0] },
     {name: "Counter-Strike: Global Offensive", quantity: 999, year: 2010, trailer: "edYCtaNueQY", loan_period: 5,  platform: platforms[0]},
     {name: "Need for Speed: Most Wanted", quantity: 999, year: 2005, trailer: "DEmRkNnCvLU", loan_period: 5,  platform: platforms[0]},
     {name: "DOTA 2", quantity: 976, year: 20133, trailer: "-cSFPIwMEq4", loan_period: 5,  platform: platforms[1]},
     {name: "Mafia III", quantity: 1, year: 2016, trailer: "TNiHOpHbCzM", loan_period: 10,  platform: platforms[2]},
     {name: "Call of Duty: Modern Warfare", quantity: 2, year: 2019, trailer: "bH1lHCirCGI", loan_period: 5,  platform: platforms[2]}
  ])