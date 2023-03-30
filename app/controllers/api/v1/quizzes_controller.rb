module Api
    module V1
      # Handles endpoints related to quizzes
      class QuizzesController < Api::V1::ApplicationController
        
        def create
          result = Quizzes::Operations.new_quiz(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            quiz: QuizBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def index
          quizzes = Quiz.all

          payload = {
            quiz: QuizBlueprint.render_as_hash(quizzes),
              status: 200
          }
          render_success(payload: payload)
        end

        def show
          quiz = Quiz.find(params[:id])
          
          payload = {
            quiz: QuizBlueprint.render_as_hash(quiz),
              status: 200
          }
          render_success(payload: payload)
        end
      end
    end
  end
  