# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner/active_record'
require 'faker'
DatabaseCleaner.clean_with(:truncation)

#--users--#
    user_1 = User.create(
        username: "ashley", 
        email: "ashley@ashley.com",
        password: "pw")

    user_2 = User.create(
        username: "nick", 
        email: "nick@nick.com",
        password: "pw")

    user_3 = User.create(
        username: "dustin", 
        email: "dustin@dustin.com",
        password: "pw")

#--topics--#
    topic_1 = Topic.create(name: Faker::ProgrammingLanguage.name)

    topic_2 = Topic.create(name: Faker::ProgrammingLanguage.name)

    topic_3 = Topic.create(name: Faker::ProgrammingLanguage.name)

    topic_4 = Topic.create(name: Faker::ProgrammingLanguage.name)


#--resources--#
    resource_1 = Resource.create(url: Faker::Internet.url, 
        description: "Resource 1 description", 
        user_id: user_1.id, 
        topic_id: topic_1.id)

    resource_2 = Resource.create(url: Faker::Internet.url, 
        description: "Resource 2* description", 
        user_id: user_2.id, 
        topic_id: topic_2.id)

    resource_3 = Resource.create(url: Faker::Internet.url, 
        description: "Resource 3! description", 
        user_id: user_3.id, 
        topic_id: topic_3.id)

    resource_4 = Resource.create(url: Faker::Internet.url, 
        description: "Resource !!!4 description", 
        user_id: user_1.id, 
        topic_id: topic_4.id)

#--reviews--#

    Review.create(stars: Faker::Number.between(from: 1, to: 5), 
        title: "Wow", 
        comment: "Best resource out there for Topic 2", 
        resource_id: resource_2.id,
        user_id: user_2.id )

    Review.create(stars: Faker::Number.between(from: 1, to: 5), 
        title: "Great", 
        comment: "Best resource out there for Topic 3", 
        resource_id: resource_3.id,
        user_id: user_3.id )

    Review.create(stars: Faker::Number.between(from: 1, to: 5), 
        title: "So good", 
        comment: "Best resource out there for Topic 1", 
        resource_id: resource_1.id,
        user_id: user_1.id )
        
    Review.create(stars: Faker::Number.between(from: 1, to: 5), 
        title: "amazing", 
        comment: "Best resource out there for Topic 4", 
        resource_id: resource_4.id,
        user_id: user_1.id )


    





