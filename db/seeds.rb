# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do |index|
#   new_user = User.new
#
#   new_user.name = Faker::Name.name
#   new_user.email = Faker::Internet.email
#
#   new_user.save
# end

# 10.times do |index|
#   new_park = Park.new
#
#   new_park.name = 'Park'
#   new_park.description = 'Lorem Ipsum'
#   new_park.picture = Faker::LoremPixel.image("300x300", false, 'nature')
#
#   new_park.save
# end

5.times do |index|
  Post.create(
    title: "Post##{index + 1}",
    body: "Lorem Ipsum",
    user_id: 22
  )
end
