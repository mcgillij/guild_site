class TrophiesController < ApplicationController
 
  def index
    @trophies = Trophy.find(:all)
  end

 
  def show
    @trophy = Trophy.find(params[:id])
  end

  def new
    @trophy = Trophy.new
  end

  def edit
    @user = User.find(session[:user_id])
    @trophy = Trophy.find(params[:id])
        
    if @trophy.user.login == @user.login or @user.is_in_role?(:Officer) or @user.is_in_role?(:Admin)
      
    else
      flash[:notice] = 'You do not have permission to edit this trophy.'
      redirect_to(trophies_url)        
    end
    
  end

  def create
    @trophy = Trophy.new(params[:trophy])

    respond_to do |format|
      if @trophy.save
        flash[:notice] = 'Trophy was successfully created.'
        format.html { redirect_to(@trophy) }
       
      else
        format.html { render :action => "new" }
      
      end
    end
  end

 
  def update
    @trophy = Trophy.find(params[:id])

    respond_to do |format|
      if @trophy.update_attributes(params[:trophy])
        flash[:notice] = 'Trophy was successfully updated.'
        format.html { redirect_to(@trophy) }
     
      else
        format.html { render :action => "edit" }
      
      end
    end
  end

 
  def destroy
    @trophy = Trophy.find(params[:id])
    @trophy.destroy

    respond_to do |format|
      format.html { redirect_to(trophies_url) }
    
    end
  end
end
