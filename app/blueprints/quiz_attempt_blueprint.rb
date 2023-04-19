class QuizAttemptBlueprint < Blueprinter::Base
    identifer :id
    fields :score, :completed, :answers, :created_at, :user
end