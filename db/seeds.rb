# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


trace = User.create(username: 'tracedelange')
dan = User.create(username: 'DanTheMan')
trixy = User.create(username: 'triXy')
pickleMan = User.create(username: 'PickleMan')


newMovie = Subject.create(name: 'new movie', description: 'Avengers endgame in theaters')
dinner = Subject.create(name: 'Pizza at dominos', description: 'Friday night dinner at dominos')


Review.create(user_id: trace.id, subject_id: dinner.id, content: 'Honestly dominos kinda hit it out of the park this time.', rating: 8)
Review.create(user_id: dan.id, subject_id: dinner.id, content: 'Dominos is gross. too greasy. Im def making homemade pizza next time', rating: 3)
Review.create(user_id: trixy.id, subject_id: newMovie.id, content: 'Damn dude. Thor goes ham.', rating: 7)
Review.create(user_id: pickleMan.id, subject_id: newMovie.id, content: 'JFC can this please be the last superhero movie that i need to watch??', rating: 2)