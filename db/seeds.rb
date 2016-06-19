l1 = Location.create({address: 'Toronto'})
l2 = Location.create({address: 'San Francisco'})
l3 =Location.create({address: 'Tokyo'})
l4 = Location.create({address: 'London'})
l5 =Location.create({address: 'Mexico City'})
l6 =Location.create({address: 'Cairo'})
l7 =Location.create({address: 'Cape Town'})
l8 =Location.create({address: 'Sydney'})

u1 = User.create({email: "oskar@gmail.com"})
u2 = User.create({email: "kacper@gmail.com"})
u3 = User.create({email: "claire@gmail.com"})

a1 = Article.create({story: 'cat went to store', title: 'cat', publishedAt: Date.today() + 1.day, location: l1})
a2 = Article.create({story: 'dog went to store', title: 'dog', publishedAt: Date.today() + 2.days, location: l2})
a3 = Article.create({story: 'bird went to store', title: 'bird', publishedAt: Date.today() + 3.days, location: l3})
a4 = Article.create({story: 'elephant went to store', title: 'elephant', publishedAt: Date.today() + 4.days, location: l1})
a5 = Article.create({story: 'monkey went to store', title: 'monkey', publishedAt: Date.today() + 5.days, location: l1})

f1 = Favourite.create(article: a1, user: u1)
f2 = Favourite.create(article: a2, user: u1)
f3 = Favourite.create(article: a2, user: u2)


