c = 1

100.times do
  name = Faker::Superhero.name
  description = Faker::Lorem.paragraph(5)
  price = (55..294).to_a.sample
  review = (0..50).to_a.sample.to_f / 10
  city = %w(Berlin Barcelona Hamburg Sydney London Paris Madrid Cologne Frankfurt Rio).sample
  height = (165..203).to_a.sample
  hair_color = ['brown', 'black', 'blond', 'white', 'light-brown', 'dark-brown', 'dark-blond', 'ginger'].sample
  eye_color = %W(green blue green-grey blue-grey hazel brown).sample
  age = (18..65).to_a.sample
  Stripper.create(name: name, price: price, review: review, description: description, city: city, height: height, hair_color: hair_color, eye_color: eye_color, age: age)
  p "worked, number #{c}"
  c += 1;
end

# how to handle those parms: :ethnicity, :characters, :solo, :availability, :pics?