class AddUserToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_reference :quizzes, :user, foreign_key: true
  end
end
