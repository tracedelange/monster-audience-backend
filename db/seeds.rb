# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'

for n in 0..100 #create one hundred random users with faker

    User.create(username: Faker::Internet.username, email: Faker::Internet.email, password_digest: Faker::Internet.uuid)
    # puts Faker::Internet.username
    # puts Faker::Internet.email
    # puts Faker::Internet.uuid
end

# # #create between 1 to 3 subjects per user.
# User.all.each do |user|
#     for n in 0...rand(4)
#         choice = rand(8)
        
#         if choice == 0
#             #beer
#             user.subjects.create(name: Faker::Beer.name, description: Faker::Beer.style )
#         elsif choice == 1
#             #book
#             user.subjects.create(name: Faker::Book.title, description: Faker::Book.genre )
#         elsif choice == 2
#             #movie
#             user.subjects.create(name: Faker::Movie.title, description: Faker::Movie.quote )
#         elsif choice == 3
#             #hobby
#             user.subjects.create(name: Faker::Hobby.activity, description: "Bascially art" )
#         elsif choice == 4
#             #job
#             user.subjects.create(name: ('Working as a ' + Faker::Job.title), description: Faker::Job.employment_type )
#         elsif choice == 5
#             #restaurant
#             user.subjects.create(name: Faker::Restaurant.name, description: Faker::Restaurant.type )
#         elsif choice == 6
#             #vehicle
#             user.subjects.create(name: Faker::Vehicle.make_and_model, description: Faker::Vehicle.car_type )
#         elsif choice == 7
#             #game
#             user.subjects.create(name: Faker::Vehicle.make_and_model, description: Faker::Vehicle.car_type )
#         elsif choice == 8
#             #music
#             user.subjects.create(name: Faker::Music.album, description: Faker::Music.genre )
#         end
#     end
# end

# # #each user leaves a review on two random subjects
User.all.each do |user|
    for n in 0..2
        quote = rand(3)
        if quote == 0
            user.reviews.create(subject_id: Subject.all.sample.id, rating: rand(11), content: Faker::Movies::HitchhikersGuideToTheGalaxy.quote)
        elsif quote == 1
            user.reviews.create(subject_id: Subject.all.sample.id, rating: rand(11), content: Faker::Quote.famous_last_words)
        elsif quote == 2
            user.reviews.create(subject_id: Subject.all.sample.id, rating: rand(11), content: Faker::Quote.most_interesting_man_in_the_world)
        end
    end
end

# # #Generate random friendships
User.all.each do |user|

    #follow between 10 to 20 random users.
    #Need to make sure you can't follow someone twice!
    range = rand(21)

    for n in 0..range

        # User.all.sample.id #Friend Id
        user.friendships.create(friend_id: User.all.sample.id)
    end

end


User.all.sample.subjects.create(name: 'Alien (1979)', description: 'Classic space horror!')
User.all.sample.subjects.create(name: 'The Shawshank Redemption', description: 'If going to prision means I can be friends with Morgan Freeman, sign me up.')
User.all.sample.subjects.create(name: 'The Dark Knight', description: 'Wheres Rachel??')
User.all.sample.subjects.create(name: 'Lord of The Rings (Movies)', description: '558 Min of fun!')
User.all.sample.subjects.create(name: 'Lord of The Rings (Books)', description: '1000+ pages of fun!')
User.all.sample.subjects.create(name: 'Python', description: 'Programming Language')
User.all.sample.subjects.create(name: 'JavaScript', description: 'Programming Language')
User.all.sample.subjects.create(name: 'Ruby', description: 'Programming Language')
User.all.sample.subjects.create(name: 'The Time Machine', description: 'Book by HG Wells')
User.all.sample.subjects.create(name: 'Stories of Your Life and Others', description: 'An anthology by Ted Chiang')
User.all.sample.subjects.create(name: 'Flatiron School Full-Stack Software Engineering Course', description: 'Learn to build webapps!')
