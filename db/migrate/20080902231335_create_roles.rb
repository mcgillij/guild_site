class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :rname
    end
  end

  def self.down
    drop_table :roles
  end
end
