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
  
  games = Game.create!([
     {name: "Grand Theft Auto V", quantity: 997, year: 2013, trailer: "VjZ5tgjPVfU", loan_period: 5, platforms: platforms[0,1], avatar: File.new('app/assets/images/gta5.jpg', 'r'), about: "Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the first main entry in the Grand Theft Auto series since 2008's Grand Theft Auto IV."},
     {name: "Counter-Strike: Global Offensive", quantity: 999, year: 2010, trailer: "edYCtaNueQY", loan_period: 5,  platforms: platforms[0,2], avatar: File.new('app/assets/images/csgo.jpg', 'r'), about: "Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Valve and Hidden Path Entertainment. It is the fourth game in the Counter-Strike series and was released for Windows, OS X, Xbox 360, and PlayStation 3 in August 2012, while the Linux version was released in 2014."},
     {name: "Need for Speed: Most Wanted", quantity: 999, year: 2005, trailer: "DEmRkNnCvLU", loan_period: 5,  platforms: platforms[0,3], avatar: File.new('app/assets/images/nfs.jpg', 'r'), about: "Need for Speed: Most Wanted is an open world racing game developed by Criterion Games and published by Electronic Arts."},
     {name: "DOTA 2", quantity: 976, year: 20133, trailer: "-cSFPIwMEq4", loan_period: 5,  platforms: platforms[1,1], avatar: File.new('app/assets/images/dota2.jpg', 'r'), about: "Dota 2 is a multiplayer online battle arena video game developed and published by Valve. The game is a sequel to Defense of the Ancients, which was a community-created mod for Blizzard Entertainment's Warcraft III: Reign of Chaos and its expansion pack, The Frozen Throne."},
     {name: "Mafia III", quantity: 1, year: 2016, trailer: "TNiHOpHbCzM", loan_period: 10,  platforms: platforms[2,1], avatar: File.new('app/assets/images/mafiaIII.jpg', 'r'), about: "Mafia III is an action-adventure video game developed by Hangar 13 and published by 2K Games. It was released in October 2016 for PlayStation 4, Xbox One, and Microsoft Windows, and in May 2017 for macOS. It is the third main game in the Mafia series, and the sequel to Mafia II."},
     {name: "Call of Duty: Modern Warfare", quantity: 2, year: 2019, trailer: "bH1lHCirCGI", loan_period: 5,  platforms: platforms[2, 1], avatar: File.new('app/assets/images/callofduty.jpg', 'r'), about: "Call of Duty: Warzone is a free-to-play battle royale video game released on March 10, 2020, for Xbox One, PlayStation 4, and PC. The game is a part of the 2019 title Call of Duty: Modern Warfare but does not require purchase of it. Warzone was developed by Infinity Ward and Raven Software and published by Activision."}
  ])