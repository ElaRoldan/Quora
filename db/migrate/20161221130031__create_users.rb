class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :employment 
      t.string :education 
      t.string :location
      t.integer :number_of_questions, default: 0
      t.integer :number_of_answers, default: 0
      t.integer :positive_votes, default: 0
      t.integer :negative_votes, default: 0
      t.timestamps
    end  
  end
end
