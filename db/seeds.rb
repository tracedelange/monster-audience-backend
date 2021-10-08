# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# trace = User.create(username: 'tracedelange', email: 'test@gmail.com', password_digest: '3737')
# dan = User.create(username: 'DanTheMan', email: 'test1@gmail.com', password_digest: '374567')
# trixy = User.create(username: 'triXy', email: 'test2@gmail.com', password_digest: '37654')
# pickleMan = User.create(username: 'PickleMan', email: 'test3@gmail.com', password_digest: '65637')


# newMovie = Subject.create(user_id: dan.id, name: 'new movie', description: 'Avengers endgame in theaters', public: true)
# dinner = Subject.create(user_id: trace.id, name: 'Pizza at dominos', description: 'Friday night dinner at dominos', public: true)
# biking = Subject.create(user_id: trixy.id, name: 'Pizza at dominos', description: 'Friday night dinner at dominos', public: false)


# Review.create(user_id: trace.id, subject_id: dinner.id, content: 'Honestly dominos kinda hit it out of the park this time.', rating: 8)
# Review.create(user_id: dan.id, subject_id: dinner.id, content: 'Dominos is gross. too greasy. Im def making homemade pizza next time', rating: 3)
# Review.create(user_id: trixy.id, subject_id: newMovie.id, content: 'Damn dude. Thor goes ham.', rating: 7)
# Review.create(user_id: pickleMan.id, subject_id: newMovie.id, content: 'JFC can this please be the last superhero movie that i need to watch??', rating: 2)

require 'faker'

for n in 0..100 #create one hundred random users with faker

    User.create(username: Faker::Internet.username, email: Faker::Internet.email, password_digest: Faker::Internet.uuid)
    # puts Faker::Internet.username
    # puts Faker::Internet.email
    # puts Faker::Internet.uuid
end


#create 3 subjects per user.
User.all.each do |user|

    for n in 0..3
        user.subjects.create(name: Faker::Coffee.blend_name, description: Faker::Lorem.sentence)
        # puts Faker::Coffee.blend_name #name
        # puts Faker::Lorem.sentence #description
    end

end

#each user leaves a review on two random subjects
User.all.each do |user|

    for n in 0..2
        user.reviews.create(subject_id: Subject.all.sample.id, rating: rand(11), content: Faker::Lorem.sentence)
        # puts Subject.all.sample.id #Subject id
        # puts rand(11) #rating
        # puts Faker::Lorem.sentence #content

    end

end

#Generate random friendships
User.all.each do |user|

    #follow between 10 to 20 random users.
    #Need to make sure you can't follow someone twice!
    range = rand(21)

    for n in 0..range

        # User.all.sample.id #Friend Id
        user.friendships.create(friend_id: User.all.sample.id)
    end

end