class AddPossibleAnswersToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :possible_answers, :text
  end
end
