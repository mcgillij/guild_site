class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  #add validation for good measure  
  validates_presence_of :rname
  validates_uniqueness_of :rname

  def self.[] (rname)    
    find(:first, :conditions => ["rname=?",rname.id2name])     
  end
end
