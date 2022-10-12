# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name: "admin", email: "admin@gmail.com",password: "adminrole",phone_number: 1234567,status: 1, role: 1)


AdminUser.create!(email: 'zahid@admin.com', password: 'adminrole', password_confirmation: 'adminrole')