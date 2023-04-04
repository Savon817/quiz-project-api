class QuizBlueprint < Blueprinter::Base
    identifier :id
    fields :title, :description, :questions, :created_at, :user

    "view :create do
        
    end"
end