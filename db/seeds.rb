# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(:email => 'user@mail.com', :password => 'postgres')
user.tasks.create([
    {
        title: "Explore Frontend",
        description: "Learn Tailwind CSS",
        dueDate: "2021-06-21",
        priority: 2,
        status: false
    },
    {
        title: "Deploy Client",
        description: "Use firebase for deployment",
        dueDate: "2021-06-20",
        priority: 1,
        status: false
    },
    {
        title: "Deploy Server",
        description: "Use heroku for deployment",
        dueDate: "2021-06-20",
        priority: 1,
        status: false
    },
    {
        title: "Explore Backend",
        description: "Learn more about Ruby on Rails",
        dueDate: "2021-06-23",
        priority: 2,
        status: false
    },
    {
        title: "Update LinkedIn",
        description: "Maybe adding some skills or do assesment tests",
        dueDate: "2021-06-21",
        priority: 3,
        status: false
    },
    {
        title: "Update Github",
        description: "Create new Project for Portfolio",
        dueDate: "2021-06-24",
        priority: 3,
        status: false
    },
    {
        title: "Explore Mobile Apps",
        description: "Learn React Native",
        dueDate: "2021-06-24",
        priority: 2,
        status: false
    }
])