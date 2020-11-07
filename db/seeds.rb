# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.delete_all
roles = Role.create([
  {
    name: "admin"
  },
  {
    name: "regular"
  }
])

User.delete_all
users = User.create([
  {
    name: "Mateusz",
    surname: "Czajka",
    date_of_birth: "09-07-1999",
    login: "matcza",
    password: "haslo123",
    is_deleted: false,
    role_id: roles.first.id
  },
  {
    name: "Antoni",
    surname: "Kolor",
    date_of_birth: "12-01-2002",
    login: "antkol",
    password: "haslo123",
    is_deleted: false,
    role_id: roles.second.id
  }
])