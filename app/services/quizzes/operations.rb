module Quizzes
    module Operations
        def self.new_quiz(params, current_user)
            quiz = current_user.quizzes.new(title: params[:title], description: params[:description], questions: params[:questions])

            return ServiceContract.success(quiz) if quiz.save

            ServiceContract.error(quiz.error.full_messages)
        end
    end
end