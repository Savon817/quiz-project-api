class QuizAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  serialize :answers
end
