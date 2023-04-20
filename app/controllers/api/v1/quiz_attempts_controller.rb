module Api
    module V1
            class QuizAttemptsController < ApplicationController
                # Authenicating the user before the Attempted Quiz is submitted
                before_action :authenticate
                
                # Making sure a quiz exist before quizAttempt executes
                before_action :set_quiz, only: [:create]
                

                # POST api/v1/quizzes/1/quiz_attempts
                def create
                    # Creates a new quiz attempt and then links it to the user
                    quiz_attempt = @quiz.quiz_attempts.build(quiz_attempt_params)
                    quiz_attempt.user = @current_user
                    
                    if quiz_attempt.save
                      # Grade the quiz attempt and update completed status
                      score = 0
                      quiz_attempt.answers.each_with_index do |answer, index|
                        # Grabs User selected answer and the correct answer from each question in the quiz
                        selected_answer = answer[1]
                        correct_answer = @quiz.questions[index][:answer]
                        # Compares Selected and Correct answers, then increments the score if they match
                        if selected_answer == correct_answer
                            score += 1
                        end
                    end
                    quiz_attempt.update(score: score, completed: true)
                
                      render json: quiz_attempt, status: :created
                    else
                      render json: { errors: quiz_attempt.errors }, status: :unprocessable_entity
                    end
                  end
                
                # GET api/v1/quiz_attempts/1
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
