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
    {text: "What is 2 + 2?", answer: "4"},
    {text: "What color is the grass?", answer: "Green"}
], possible_answers: [
    {question_one_option1: "4", question_one_option2: "6", question_one_option3: "7", question_one_option4: "8"},
    {question_two_option1: "Blue", question_two_option2: "Red", question_two_option3: "Green", question_two_option4: "Yellow"}
])