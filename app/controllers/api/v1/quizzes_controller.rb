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

      end
    end
  end
  