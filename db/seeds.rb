# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'active_support/core_ext/date/calculations'

puts 'creating db entries '

# Create coaches
coach = User.create(username: 'coach', email: 'coach@prostrength.de', password: 'Test1234',
                    password_confirmation: 'Test1234', role: :coach)
Profile.create!(user: coach,
                about_me: 'Hey, ich bin Felix. Regelmäßiger Sport, nährstoffreiches Essen und ein aktiver Lifestyle bestimmen einen Großteil meines Lebens. Zu sehen, was der eigene Körper leisten kann, sobald man Zeit und Bewusstsein in seine Gesundheit investiert, ist das, wofür ich brenne. Und hierbei unterstütze ich Menschen seit über 10 Jahren.')

#  Create customers
25.times do |count|
  user_str = "customer#{count}"
  User.create(username: user_str, email: "#{user_str}@prostrength.de", password: 'Test1234',
              password_confirmation: 'Test1234', role: :user, coach_id: coach.id)
end

# Create admins
Admin.create(username: 'admin', email: 'admin@prostrength.de', password: 'Test1234',
             password_confirmation: 'Test1234')

exercises = Exercise.create!([{ title: 'Back Squad' }, { title: 'Bench Press' }, { title: 'Deadlift' },
                              { title: 'Dumbbell Press' }, { title: 'Dumbbell Row' }])
workouts = Workout.create!([{ created_by: coach.id, title: 'Upper-Body-1-intensification' }, { title: 'Upper-Body-2-intensification' }, { title: 'Lower-Body-2-intensification' },
                            { title: 'Lower-Body-1-intensification' }])

workout_sets = WorkoutSet.create!([
                                    { workout: Workout.find(1), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(1), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(1), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(1), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(1), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(2), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(3), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) },
                                    { workout: Workout.find(4), exercise: Exercise.find(rand(1..5)),
                                      repetition: rand(1..15), tempo: rand(100..333), pause: rand(60..300) }

                                  ])

plan = Plan.create(title: 'intensification-aheumaier')
plan = Plan.create(title: 'intensification-user0')
plan = Plan.create(title: 'intensification-user1')

trainigs = TrainingSession.create!([
                                     { plan: Plan.find(rand(1..3)), user: User.find(1), workout: Workout.find(rand(1..4)),
                                       start_time: Date.today },
                                     { plan: Plan.find(rand(1..3)), user: User.find(1), workout: Workout.find(rand(1..4)),
                                       start_time: Date.tomorrow },
                                     { plan: Plan.find(rand(1..3)), user: User.find(1), workout: Workout.find(rand(1..4)),
                                       start_time: Date.today },
                                     { plan: Plan.find(rand(1..3)), user: User.find(1), workout: Workout.find(rand(1..4)),
                                       start_time: Date.tomorrow },
                                     { plan: Plan.find(rand(1..3)), user: User.find(1), workout: Workout.find(rand(1..4)),
                                       start_time: Date.yesterday }
                                   ])
puts 'creating done'
