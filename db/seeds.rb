# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat_array = [
  "homework",
  "housework",
  "assigment",
  "project",
  "work"
]

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


cat_array.each do |cat|
  Category.create(name: cat, description: cat, active: true)
end

user = User.create(first_name: "ahmad", last_name: "syahir", email: "ahmadsyahirmuhamad@gmail.com", password: "password", password_confirmation: "password")


3.times do |x|
  category = Category.limit(1).order("RANDOM()").first
  user.todos.create(
    title: Faker::Name.title,
    description: Faker::Lorem.sentence,
    category_id: category.id
    )
end



