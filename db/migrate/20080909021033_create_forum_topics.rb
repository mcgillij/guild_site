class CreateForumTopics < ActiveRecord::Migration
  def self.up
    create_table :forum_topics do |t|
      t.string :title
      t.references :user
      t.boolean :sticky, :defaults => false
      t.timestamps
    end
  end

  def self.down
    drop_table :forum_topics
  end
end
