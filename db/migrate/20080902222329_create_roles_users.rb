class CreateRolesUsers < ActiveRecord::Migration
  def self.up
    create_table :roles_users do |t|
      t.references :user
      t.references :role
    end
  end

  def self.down
    drop_table :roles_users
  end
end
