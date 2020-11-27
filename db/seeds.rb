# coding: utf-8

ContactPerson.delete_all
Company.delete_all
Industry.delete_all

User.delete_all
Role.delete_all

roles = Role.create([
  {
    name: "admin"
  },
  {
    name: 'moderator'
  },
  {
    name: "regular"
  }
])

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
  },
  {
    name: "Agata",
    surname: "Nowak",
    date_of_birth: "01-01-1996",
    login: "aganow",
    password: "haslo123",
    is_deleted: false,
    role_id: roles[2].id
  }
])

industries = Industry.create([
  {
    name: 'Airlines'
  },
  {
    name: 'Banking'
  },
  {
    name: 'Health'
  },
  {
    name: 'Insurance'
  },
  {
    name: 'Education'
  }
])

companies = Company.create([
  {
    name: 'Fly',
    nip: 1111111111,
    industry_id: industries[0].id,
    address: 'Lotnisowo 17',
    city: 'Poznań',
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: 'Money Money Money',
    nip: 9999999999,
    industry_id: industries[1].id,
    address: 'Bankowa 12',
    city: 'Warszawa',
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: 'VaBank',
    nip: 8888888888,
    industry_id: industries[1].id,
    address: 'Bankowa 13',
    city: 'Warszawa',
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: 'BeFit',
    nip: 7777777777,
    industry_id: industries[2].id,
    address: 'Fitnessowa 1',
    city: 'Gdynia',
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: 'Careful',
    nip: 5555555555,
    industry_id: industries[3].id,
    address: 'Ubezpieczeniowa 42',
    city: 'Gniezno',
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: 'Smart',
    nip: 3333333333,
    industry_id: industries[4].id,
    address: 'Szkolna 22',
    city: 'Wrocław',
    is_deleted: false,
    user_id: users.first.id
  }
])

contacts = ContactPerson.create([
  {
    name: "Jan",
    surname: "Nowak",
    phone: "01-12-1977",
    email: "jannow@test.pl",
    position: "szef",
    company_id: companies[0].id,
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: "Krystyna",
    surname: "Kowalska",
    phone: "11-11-1980",
    email: "krykow@wp.pl",
    position: "handlarz",
    company_id: companies[0].id,
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: "Krzysztof",
    surname: "Kowalczyk",
    phone: "05-03-1997",
    email: "krzkow@gmail.com",
    position: "dyrektor",
    company_id: companies[1].id,
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: "Tobiasz",
    surname: "Donder",
    phone: "05-06-1991",
    email: "tobdod@gmail.com",
    position: "prawnik",
    company_id: companies[1].id,
    is_deleted: false,
    user_id: users.first.id
  },
  {
    name: "Aleksy",
    surname: "Nazwisko",
    phone: "05-03-1957",
    email: "alenaz@gmail.com",
    position: "dyrektor",
    company_id: companies[2].id,
    is_deleted: false,
    user_id: users.first.id
  }
])