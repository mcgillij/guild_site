namespace :guild do
  desc "Make the first user an admin"
  task (:make_admin => :environment) do
    user = User.find(:first)
    role = RolesUsers.find(:first, :conditions => {:user_id => user.id})
    if role.update_attributes(:role_id => 1)
      puts user.login + " was updated to be an admin"
    else      puts "There was a horrible error, quite possibly you don't have a user created yet" 
    end
  end
end