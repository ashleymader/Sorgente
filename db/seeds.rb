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
    topic_1 = Topic.create(name: "SQL")

    topic_2 = Topic.create(name: "Rails")

    topic_3 = Topic.create(name: "GitHub")

    topic_4 = Topic.create(name: "Javascript" )

#--resources--#
    resource_1 = Resource.create(site_name: "SQLClauses", 
        url: "http://www.sqlclauses.com/sql+aggregate+functions", 
        description: "SQL aggregate functions", 
        user_id: user_1.id, 
        topic_id: topic_1.id)

    resource_2 = Resource.create(site_name: "Rails Notes For Professionals Book", 
        url: "https://books.goalkicker.com/RubyOnRailsBook/", 
        description: "Free book on rails compiled by the people at stack overflow", 
        user_id: user_2.id, 
        topic_id: topic_2.id)

    resource_3 = Resource.create(site_name: "Oh Shit Git", 
        url: "http://ohshitgit.com/", 
        description: "What to do if you make a mistake. This isn't always addressed in beginner courses", 
        user_id: user_3.id, 
        topic_id: topic_3.id)

    resource_4 = Resource.create(site_name: "Async JavaScript Cheatsheet", 
        url: "https://raw.githubusercontent.com/frontarm/async-javascript-cheatsheet/0fc4ce398819501062a9be311d1fcf35ececa00c/async-cheatsheet.png", 
        description: "Javascript cheat sheet", 
        user_id: user_1.id, 
        topic_id: topic_4.id)

#--reviews--#

    Review.create(stars: "5", 
        title: "Wow", 
        comment: "Best resource out there for Rails", 
        resource_id: resource_2.id,
        user_id: user_2.id )

    Review.create(stars: "5", 
        title: "Great", 
        comment: "Helped me understand how to fix xyz mistake I made.", 
        resource_id: resource_3.id,
        user_id: user_3.id )

    Review.create(stars: "2", 
        title: "Bad", 
        comment: "This site just didn't help at all. Too confusing.", 
        resource_id: resource_1.id,
        user_id: user_1.id )
        
    Review.create(stars: "4", 
        title: "Love it!", 
        comment: "Short and sweet cheatsheet!", 
        resource_id: resource_4.id,
        user_id: user_1.id )


    





