class CommentsController < ApplicationController
  before_filter :load_post

  def load_post
    @post = Post.find(params[:post_id])
  end

  def new
    @comment = @post.comments.build
  end
  
  def create
    if params[:comment][:user_id]
      @comment = @post.comments.build(params[:comment])
    else 
      @comment = @post.comments.build(:body => params[:comment][:body], :user_id => nil)
    end
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@post) }
        
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
      
      else
        format.html { render :action => "edit" }
       
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_comments_url(@post)) }
    end
  end
end
