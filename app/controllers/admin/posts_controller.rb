class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.find(:all)
  end


  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    
    @post = Post.new(:public_flag => params[:post][:public_flag].to_i, :title => params[:post][:title], :body => params[:post][:body], :user_id => params[:post][:user])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to([:admin, @post]) }
    
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to([:admin, @post]) }
      else
        format.html { render :action => "edit" }
        
      end
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(admin_posts_url) }
  
    end
  end
end
