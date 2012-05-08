class Admin::LinksController < ApplicationController
 
  def index
    @user = User.find(session[:user_id])
  end

end
