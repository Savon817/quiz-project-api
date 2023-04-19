module Api
    module V1
            class QuizAttemptsController < ApplicationController
                 before_action :authenticate
                before_action :set_quiz, only: [:create]
                

                # POST api/v1/quizzes/21/quiz_attempts or at least that's it's supposed to do
                def create
                    quiz_attempt = @quiz.quiz_attempts.build(quiz_attempt_params)
                    quiz_attempt.user = @current_user
                    if quiz_attempt.save

                      # Grade the quiz attempt and update completed status
                      score = 0
                      quiz_attempt.answers.each_with_index do |answer, index|
                        if answer == @quiz.questions[index][:answer]
                          score += 1
                        end
                      end
                      quiz_attempt.update(score: score, completed: true)
                
                      render json: quiz_attempt, status: :created
                    else
                      render json: { errors: quiz_attempt.errors }, status: :unprocessable_entity
                    end
                  end
                
                def show
                    quiz_attempt = @current_user.quiz_attempts.find(params[:id])
                    
                    render json: quiz_attempt
                end
            
                private
            
                def quiz_attempt_params
                    params.require(:quiz_attempt).permit(:id, answers: {}).to_hash
                end

                def set_quiz
                    @quiz =  Quiz.find(params[:quiz_id])
                end
            end
    
    end
end