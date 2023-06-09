module Api
    module V1
      # Handles endpoints related to quizzes
      class QuizzesController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[home random show index]
        def create
          result = Quizzes::Operations.new_quiz(params, @current_user)
          params[:questions]
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

        def update
          result = Quizzes::Operations.update_quiz(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            quiz: QuizBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy
          quiz = Quiz.find(params[:id])
          quiz.destroy
          render_success(payload: "Quiz has been deleted", status: 200)
        end

        def home
          render_success(payload: {suggested: Quiz.order("RANDOM()").limit(6)})
        end

        def random
          render_success(payload: {random: Quiz.order("RANDOM()").limit(1)})
        end

      end
    end
  end
  