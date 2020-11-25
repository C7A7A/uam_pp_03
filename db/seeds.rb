# coding: utf-8

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
    role_id: roles.first.id # CR: To jest kiepska komstrukcja, bardzo nieprofesjonalna. zdecydowanie lepiej role_id: Role.find_by(name: 'admin')
  },
  {
    name: "Antoni",
    surname: "Kolor",
    date_of_birth: "12-01-2002",
    login: "antkol",
    password: "haslo123",
    is_deleted: false,
    role_id: roles.second.id # CR: tu tak samo
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

# CR: po co zmienna companies? nigdzie nie jest uzyta w tym pliku. rozumiem ze konsekwentnie z industries czy users po prostu, jednak bez sensu
companies = Company.create([
  {
    name: 'Fly',
    nip: 1111111111,
    industry_id: industries[0].id, # CR: Tu jak z roles. Industry.find_by(name: 'Airlanes')
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
