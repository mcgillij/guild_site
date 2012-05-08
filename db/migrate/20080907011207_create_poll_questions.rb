class CreatePollQuestions < ActiveRecord::Migration
  def self.up
    create_table :poll_questions do |t|
      t.string :name
      t.string :description
      t.references :user
      t.boolean :active, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :poll_questions
  end
end
