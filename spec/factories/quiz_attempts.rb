FactoryBot.define do
  factory :quiz_attempt do
    user { nil }
    quiz { nil }
    score { 1 }
    completed { false }
  end
end
