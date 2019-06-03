# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coworker.create(name: 'Erik', arrived: false, sha: "123ABC")
Coworker.create(name: 'Daniel', arrived: false, sha: "456DEF")
Coworker.create(name: 'Tomas', arrived: false, sha: "533SVS")
Coworker.create(name: 'Ben', arrived: false, sha: "DSA694")
Coworker.create(name: 'Emma', arrived: false, sha: "123ABC")
Coworker.create(name: 'Vera', arrived: false, sha: "345DKM")
Coworker.create(name: 'Ida', arrived: false, sha: "365KMK")
Coworker.create(name: 'Luna', arrived: false, sha: "257BVE")
Coworker.create(name: 'Adam', arrived: false, sha: "000FFF")


# 9.times do |index|
#   Coworker.create(
#     name: Faker::Name.first_name,
#     arrived: Faker::Boolean.boolean(0),
#     sha: Faker::Internet.password(6, 6, false),
#   )
# end

