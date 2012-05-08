class RolesUsersController < ApplicationController
  def index
    @roles_users = RolesUsers.find(:all)
  end

  def show
    @roles_users = RolesUsers.find(params[:id])
    @users = User.find(:all)
  end

  def new
    @users_role = RolesUsers.new
    @roles = Role.find(:all)
    @users = User.find(:all)
  end

  def edit
    @roles_users = RolesUsers.find(params[:id])
    @user = User.find(@roles_users.user_id)
    @roles = Role.find(:all)
  end

  def create
    @roles_users = RolesUsers.new(:user_id => params[:user_id][:id], :role_id => params[:role_id][:id])

    respond_to do |format|
      if @roles_users.save
        flash[:notice] = 'Users Roles was successfully created.'
        format.html { redirect_to(@roles_users) }
     
      else
        format.html { render :action => "new" }
     
      end
    end
  end

  def update
    @roles_users = RolesUsers.find(params[:id])
    respond_to do |format|
      if @roles_users.update_attributes(:role_id => params[:role_id])
        flash[:notice] = 'Users Roles was successfully updated.'
        format.html { redirect_to(roles_users_path) }
      
      else
        format.html { render :action => "edit" }
      
      end
    end
  end

 
  def destroy
    @roles_users = RolesUsers.find(params[:id])
    @roles_users.destroy

    respond_to do |format|
      format.html { redirect_to(roles_users_url) }
   
    end
  end
end
