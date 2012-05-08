class CreateTrophies < ActiveRecord::Migration
  def self.up
    create_table :trophies do |t|
      t.string :title
      t.text :body
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :trophies
  end
end
