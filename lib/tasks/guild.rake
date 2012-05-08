namespace :guild do
  desc "Make the first user an admin"
  task (:make_admin => :environment) do
    user = User.find(:first)
    role = RolesUsers.find(:first, :conditions => {:user_id => user.id})
    if role.update_attributes(:role_id => 1)
      puts user.login + " was updated to be an admin"
    else
    end
  end
end