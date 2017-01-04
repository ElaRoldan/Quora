class CreateQuestionsVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
      t.integer :positive, default: 0
      t.integer :negative, default: 0
      t.timestamps
    end  
  end
end
