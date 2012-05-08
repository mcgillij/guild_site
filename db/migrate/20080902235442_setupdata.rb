class Setupdata < ActiveRecord::Migration
  def self.up
    role = Role.create(:rname => 'Admin')
    role = Role.create(:rname => 'Officer')
    role = Role.create(:rname => 'Member')
    role = Role.create(:rname => 'Recruit')
  end

  def self.down
  end
end
