class ForumTopicsController < ApplicationController
# 
  def index
    @sticky_forum_topics = ForumTopic.paginate :page => params[:page], :per_page => 5, :order => 'updated_at DESC', :conditions => {:sticky => true }
    @forum_topics = ForumTopic.paginate :page => params[:page], :per_page => 5, :order => 'updated_at DESC', :conditions => {:sticky => false }
  end
#
  def show
    @forum_topic = ForumTopic.find(params[:id])
  end
#
# 
  def new
    @forum_topic = ForumTopic.new
  end

  def edit
    @forum_topic = ForumTopic.find(params[:id])
  end

  def create
    @forum_topic = ForumTopic.new(:title => params[:forum_topic][:title], :sticky => false, :user_id => params[:forum_topic][:user_id])

    respond_to do |format|
      if @forum_topic.save
        @forum_post = ForumPost.new(:forum_topics_id => @forum_topic.id, :body => params[:forum_topic][:body], :user_id => params[:forum_topic][:user_id])
        if @forum_post.save
          flash[:notice] = 'Forum Topic, and Body was successfully created.'
          format.html{redirect_to(forum_topic_path(@forum_topic))}
            
        end
      else
        flash[:notice] = 'Forum Topic was not created.'
        format.html { render :action => "new" }
        
      end
    end
  end
#
# 
  def update
    @forum_topic = ForumTopic.find(params[:id])

    respond_to do |format|
      if @forum_topic.update_attributes(params[:forum_topic])
        flash[:notice] = 'ForumTopic was successfully updated.'
        format.html { redirect_to :controller => 'forum'  }
       
     else
        flash[:notice] = 'Forum Topic was not updated.'
        format.html { redirect_to :controller => 'forum'  }
        
      end
    end
  end
#
#
  def destroy
    @forum_topic = ForumTopic.find(params[:id])
    @forum_topic.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'forum'  }
      
    end
  end
end
