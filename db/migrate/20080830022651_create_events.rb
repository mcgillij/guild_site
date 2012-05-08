class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start_date
      t.string :length
      t.references :user 
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
