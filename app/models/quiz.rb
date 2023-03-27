class Quiz < ApplicationRecord
    serialize :questions, Array
    serialize :possible_answers, Array
    belongs_to :user
end
