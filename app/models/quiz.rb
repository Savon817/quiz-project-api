class Quiz < ApplicationRecord
    belongs_to :user
    has_many :quiz_attempts, dependent: :destroy
    
    serialize :questions, Array
    serialize :possible_answers, Array
end
