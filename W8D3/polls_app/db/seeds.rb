# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usernames = [{ "username" => "rshepheard0" }, { "username" => "nsword1" }, { "username" => "cbusher2" }, { "username" => "erubee3" }, { "username" => "naishford4" }]
polls     = [{ "title" => "Cras pellentesque volutpat dui?", "user_id" => 3 }, { "title" => "Dis parturient montes, nascetur mus?", "user_id" => 2 }, { "title" => "Duis ac nibh?", "user_id" => 1 }, { "title" => "Nulla neque libero, convallis eget, nibh?", "user_id" => 3 }, { "title": "In hac habitasse platea dictumst?", "user_id" => 5 }]
questions = [{ "body" => "Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh?", "poll_id" => 4 }, { "body" => "Duis ac nibh.", "poll_id" => 5 }, { "body" => "Donec semper sapien a libero.", "poll_id" => 2 }, { "body" => "Curabitur at ipsum ac tellus semper interdum.", "poll_id" => 1 }, { "body" => "Duis consequat dui nec nisi volutpat eleifend.", "poll_id" => 1 }]
choices   = [{ "body" => "concept", "question_id" => 5 }, { "body" => "functionalities", "question_id" => 3 }, { "body" => "Quality-focused", "question_id" => 3 }, { "body" => "customer loyalty", "question_id" => 3 }, { "body" => "exuding", "question_id" => 3 }]
responses = [{ "answer_choice_id" => 4, "user_id" => 5 }, { "answer_choice_id" => 5, "user_id" => 4 }, { "answer_choice_id" => 5, "user_id" => 3 }, { "answer_choice_id" => 3, "user_id" => 5 }, { "answer_choice_id" => 2, "user_id" => 4 }]

User.destroy_all
usernames.each {|username| User.create(username)}

Poll.destroy_all
polls.each {|poll| Poll.create(poll)}

Question.destroy_all
questions.each {|question| Question.create(question)}

AnswerChoice.destroy_all
choices.each {|choice| AnswerChoice.create(choice)}

Response.destroy_all
responses.each {|response| Response.create(response)}