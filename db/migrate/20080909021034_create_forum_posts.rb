class CreateForumPosts < ActiveRecord::Migration
  def self.up
    create_table :forum_posts do |t|
      t.text :body
      t.references :user
      t.references :forum_topics

      t.timestamps
    end
  end

  def self.down
    drop_table :forum_posts
  end
end
