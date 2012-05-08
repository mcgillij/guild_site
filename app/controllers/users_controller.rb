class UsersController < ApplicationController
  def index
    @users = User.find(:all)    
  end
  
  def show
    @user = User.find(params[:id])    
  end  
  
  # render new.rhtml
  def new
    @player_classes = list_classes
    @images_array = list_avatars       
  end
  
  def edit
    @player_classes = list_classes
    @images_array = list_avatars
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
      
      else
        format.html { render :action => "edit" }
       
      end
    end
  end
  
  def create    
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save

    @player_classes = list_classes
    @images_array = list_avatars
    
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/posts/')
      @role = Role.find(:first, :conditions => ['rname=?', 'Recruit'])   
      @plrole = RolesUsers.create(:user_id => @user.id,:role_id =>@role.id)
      @plrole.save

      flash[:notice] = "Thanks for signing up!"
    else
      flash[:notice] = "Something was horribly wrong with the user creation!"
      render :action => 'new'
    end
  end
  
end
