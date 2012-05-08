class CreatePollAnswers < ActiveRecord::Migration
  def self.up
    create_table :poll_answers do |t|
      t.string :description
      t.references :poll_question
      t.integer :votes, :default => 0
      
    end
  end

  def self.down
    drop_table :poll_answers
  end
end
