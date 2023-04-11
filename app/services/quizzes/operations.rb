module Quizzes
    module Operations
        def self.new_quiz(params, current_user)
            questions = []
            params[:questions].each do |question|
                hash = {question: question[:question], answer: question[:answer], possible_answers: question[:possible_answers]}
                questions.push(hash)
            end
            quiz = current_user.quizzes.new(title: params[:title], description: params[:description], questions: questions)
            

            return ServiceContract.success(quiz) if quiz.save

            ServiceContract.error(quiz.error.full_messages)
        end

        def self.update_quiz(params)

            
            quiz = Quiz.find(params[:id])
            questions = params[:questions].map do |question|
                {
                  question: question[:question],
                  answer: question[:answer],
                  possible_answers: question[:possible_answers]
                }
              end

            return ServiceContract.success(quiz) if quiz.update(title: params[:title], description: params[:description], questions: questions)

            ServiceContract.error(quiz.error.full_messages)
        end
    end
end