class PostsController < ApplicationController
 
  def index
    @posts = Post.public
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
end
