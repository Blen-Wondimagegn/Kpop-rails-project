# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 5.times do 
#     Artists.create(group_name: Faker::Kpop.iii_groups, member: Faker::Name.name, gender: Faker::Demographic.sex, height: Faker::Demographic.height(unit: :imperial), fav_quote:Faker::Quotes::Shakespeare.hamlet_quote, user_id: 1)
# end
5.times do
    User.create(email: Faker::Internet.email, password:"password", name: Faker::Name.middle_name, username:Faker::Name.first_name)
end


10.times do 
    Artist.create(name: Faker::Kpop.solo, gender: Faker::Demographic.sex, height: Faker::Demographic.height(unit: :imperial), age: Faker::Number.within(range: 20..35))
end


30.times do
    Glam.create(glam_squad: Faker::Space.star, makeup:Faker::Name.first_name, hair: Faker::Name.middle_name, wardrobe: Faker::Name.initials, artist_id: rand(1..10), user_id:rand(1..5))
end

