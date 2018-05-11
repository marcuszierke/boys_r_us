require 'open-uri'
require 'nokogiri'
require 'faker'

photos =[
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999913/In_Diana_Jones.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999912/Horseleg.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908946/Left_Right.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999934/Mr_Waterproof.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1526000036/G-Spot.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908934/B.A.Baracus.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525912152/Lord_Sexpack.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1526000798/Hugh_R._Ection.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999906/Admiral_Mighty_Balls.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908944/Harry_Baals.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999908/Ben_Dover.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908941/Toyboy.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999906/Don_King.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908941/The_Anal_Yst.png'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908940/Creamy_Backfist.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525999912/Jizzy.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908936/Specki.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908946/Left_Right.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1526036249/Dr._Chain.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908934/Mr._Babewatch.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908934/Mr._Bombastic.jpg'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525909769/The_Punisher.png'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525908952/Machete.png'],
  ['http://res.cloudinary.com/dxoifz29v/image/upload/v1525909769/Muscle_Markus.png']
]

User.destroy_all
Stripper.destroy_all
# creating personal stripper instances
characters = ["Policeman", "Firefighter", "Delivery-Guy", "Motz-Salesman", "Soldier", "Professor", "Cowboy", "Construction-Worker", "Santa", "Cab-Driver", "Waiter", "Bowling-Instructor"]

c = 1
d = 0
a = 0
b = 0
url = open('http://www.pickuplinesgalore.com/crude.html').read
html_file = Nokogiri::HTML(url)

quotes = []
html_file.search('.paragraph-text-7').each do |item|
  quotes << item.text.strip
end

quotes = quotes[-1].split("\n")

24.times do
  characters = ["Policeman", "Firefighter", "Delivery-Guy", "Motz-Salesman", "Soldier", "Professor", "Cowboy", "Construction-Worker", "Santa", "Cab-Driver", "Waiter", "Bowling-Instructor"]
  arr = []
  rounds = (5..12).to_a.sample
  arr << characters.sample(rounds)
  characters = arr.join(" ")
  name = photos[a][0].split('/')[-1][0...-4].gsub("_", " ")
  description = quotes[b]
  b += 4
  price = (55..294).to_a.sample
  review = (0..5).to_a.sample
  ethnicity = %w(oceanic caucasian black asian latino).sample
  city = %w(Berlin Barcelona New\ York Hamburg Sydney London Paris Madrid Cologne Frankfurt Rio\ de \Janeiro).sample
  height = (169..203).to_a.sample
  hair_color = ['brown', 'black', 'blond', 'white', 'light-brown', 'dark-brown', 'dark-blond', 'ginger'].sample
  eye_color = %W(green blue green-grey blue-grey hazel brown).sample
  age = (22..65).to_a.sample
  email = Faker::Internet.email
  photo_urls = photos[a]
  pics1 = photo_urls[0]
  pics2 = photo_urls[0]
  pics3 = photo_urls[0]
  pics4 = photo_urls[0]
  Stripper.create(password: "password", email: email, characters: characters, ethnicity: ethnicity, name: name, price: price, review: review, description: description, city: city, height: height, hair_color: hair_color, eye_color: eye_color, age: age, pics1: pics1, pics2: pics2, pics3: pics3, pics4: pics4)
  p "Stripper #{a}"
  a += 1
end

review = (0..50).to_a.sample.to_f / 10

p1 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519212712/Bildschirmfoto_2018-02-21_um_12.21.32.png'
p2 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519212712/Bildschirmfoto_2018-02-21_um_12.23.01.png'
p3 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519212712/Bildschirmfoto_2018-02-21_um_12.21.58.png'
p4 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519212897/Bildschirmfoto_2018-02-21_um_12.34.34.png'


# creating 4 demo users
User.create(email: "tuan@lewagon.com", password: "password", avatar: p1, name: "Tuan Pererea")
User.create(email: "julian@lewagon.com", password: "password", avatar: p2, name: "Julian Lovelace")
User.create(email: "moritz@lewagon.com", password: "password", avatar: p3, name: "Moritz Motz")
User.create(email: "marcus@lewagon.com", password: "password", avatar: p4, name: "Mickey Mahoney")


