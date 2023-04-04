module Quizzes
    module Operations
        def self.new_quiz(params, current_user)
            questions = []
            params[:questions].each do |question|
                hash = {question: question[:question], answer: question[:answer]}
                questions.push(hash)
            end
            quiz = current_user.quizzes.new(title: params[:title], description: params[:description], questions: params[:questions])
            debugger

            return ServiceContract.success(quiz) if quiz.save

            ServiceContract.error(quiz.error.full_messages)
        end

        def self.update_quiz(params)
            quiz = Quiz.find(params[:id])

            return ServiceContract.success(quiz) if quiz.update(title: params[:title], description: params[:description], questions: params[:questions])

            ServiceContract.error(quiz.error.full_messages)
        end
    end
end