# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  UserType.create(name: "admin")   
  User.create(name: "Admin", email: "admin@example.com", user_type_id: 1, password: "123456", password_confirmation: "123456")
