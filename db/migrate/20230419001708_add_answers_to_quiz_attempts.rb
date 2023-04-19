class AddAnswersToQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    add_column :quiz_attempts, :answers, :text
  end
end
