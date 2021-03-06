users = [
  { fname: 'Jon', lname: 'Doe', email: 'e@example.com', phone: 123 },
  { fname: 'Jane', lname: 'Doe', email: 'a@example.com', phone: 321 }
]

users.each do |u|
  User.create(u)
end

wines = [{ name: 'Chardonnay Lauren Vineyard', wine_variety: 'White', produced_year: '2019', produced_place: 'France' },
         { name: 'Brunello di Montalcino', wine_variety: 'Red', produced_year: '2016', produced_place: 'Italy' }]

wines.each do |w|
  Wines.create(w)
end