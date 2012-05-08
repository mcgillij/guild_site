class EventsController < ApplicationController
 
  def index
    @events = Event.find(:all, :conditions => ['start_date >= ?', Time.now])
  end
  
  def past
    @events = Event.find(:all, :conditions => ['start_date < ?', Time.now])
  end
 
  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
    
      else
        format.html { render :action => "edit" }
      
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
    end
  end
end
