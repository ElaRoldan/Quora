class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :user, index: true
      t.string :question_sentence
      t.timestamps
    end  
  end
end
