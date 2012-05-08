class ForumController < ApplicationController
  def index
    @sticky_forum_topics = ForumTopic.paginate  :order => 'updated_at DESC', :conditions => {:sticky => true }, :page => params[:page], :per_page => 5
    @forum_topics = ForumTopic.paginate :page => params[:page], :per_page => 5, :order => 'updated_at DESC', :conditions => {:sticky => false }
  end
  
  def new
    @forum_topic = ForumTopic.find(params[:id])
    @forum_post = ForumPost.new
  end
  
  def edit
    @forum_post = ForumPost.find(params[:id])
    @forum_topic = ForumTopic.find(@forum_post.forum_topics_id)
  end
  
  def create
    @forum_post = ForumPost.new(params[:forum_post])

    respond_to do |format|
      if @forum_post.save
        flash[:notice] = 'Forum Post was successfully created.'
        format.html { redirect_to forum_topic_path(@forum_post.forum_topics_id)  }
        
      else
        flash[:notice] = 'Forum Post was not created.'
        format.html { redirect_to :controller => 'forum'  }
        
      end
    end
  end
  
  def update
    @forum_post = ForumPost.find(params[:id])

    respond_to do |format|
      if @forum_post.update_attributes(params[:forum_post])
        flash[:notice] = 'Forum Post was successfully updated.'
        format.html { redirect_to :controller => 'forum'  }
      
    else
        flash[:notice] = 'Forum Post was not updated.'
         format.html { redirect_to :controller => 'forum'  }
        
      end
    end
  end
  
  def sticky
    @forum_topic = ForumTopic.find(params[:id])

    respond_to do |format|
      if @forum_topic.update_attributes(:sticky => 1)
        flash[:notice] = 'Forum Topic was successfully updated.'
        format.html { redirect_to :controller => 'forum'  }
      
    else
        flash[:notice] = 'Forum Topic was not updated.'
        format.html { redirect_to :controller => 'forum'  }
        
      end
    end
  end
  
  def unsticky
    @forum_topic = ForumTopic.find(params[:id])

    respond_to do |format|
      if @forum_topic.update_attributes(:sticky => 0)
        flash[:notice] = 'Forum Topic was successfully updated.'
        format.html { redirect_to :controller => 'forum'  }
      
    else
        flash[:notice] = 'Forum Topic was not updated.'
        format.html { redirect_to :controller => 'forum'  }
        
      end
    end
  end
  
end
