#!/bin/bash

# a workout has many workout_sets

# a set has many repetitions
# a set has many lifts
# a set has a tempo
# a set has a pause between iterations
# a set has an exercise

rails destroy scaffold WorkoutSet
rails destroy scaffold Lift
rails destroy scaffold Repetition
rails destroy scaffold Tempo
rails destroy scaffold Pause
rails destroy scaffold Exercise
rails destroy scaffold Workout
RAILS_ENV=development rails db:drop

rails g scaffold workout:references exercise:references lift:references repetition:references tempo:references pause:references
rails g scaffold WorkoutSet workout:references exercise:references lift:references repetition:references tempo:references pause:references
rails g TrainingSession workout:references plan:references

rails g scaffold scaffold plan
rails g scaffold Lift weight:integer
rails g scaffold Repetition count:integer
rails g scaffold Tempo duration:string
rails g scaffold Pause length:integer
rails g scaffold Exercise title:string notes:string
rails g scaffold Workout title:string notes:string

RAILS_ENV=development rails db:migrate
