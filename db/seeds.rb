# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
quiz = Quiz.create(title: "My Quiz", questions: [
    { text: "What is 1 + 1?", answer: "2" },
    { text: "What color is the sky?", answer: "Blue" }
  ])

quiz_two = Quiz.create(title: "My Second Quiz", questions: [