# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
initial_categories = Category.create([{title: 'Web Development'}, {title: 'Programming languages'}])

initial_tests = Test.create([
                                {title: 'Rails', level: 0, category: initial_categories[0]},
                                {title: 'Ruby', level: 0, category: initial_categories[1]},
                            ])
initial_questions = Question.create([
                                        {body: 'Who?', test: initial_tests[0]},
                                        {body: 'Why?', test: initial_tests[1]},
                                    ])
initial_answers = Answer.create([
                                    {body: 'Me', correct: true, question: initial_questions[0]},
                                    {body: 'Just because', correct: true, question: initial_questions[1]}
                                ])
admin = User.create({username: 'admin', password: 'root', email: 'admin@admin.com'})
