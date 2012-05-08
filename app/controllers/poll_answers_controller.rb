class PollAnswersController < ApplicationController
 def new
    @poll_answer = PollAnswer.new
 end

  # GET /poll_answers/1/edit
  def edit
    @poll_answer = PollAnswer.find(params[:id])
  end

  # POST /poll_answers
  # POST /poll_answers.xml
  def create
  
    @poll_answer = PollAnswer.new(params[:poll_answer])

    respond_to do |format|
      if @poll_answer.save
        flash[:notice] = 'Poll Answer was successfully created.'
        format.html { redirect_to :controller => 'poll', :action => 'index' }
        
      else
        flash[:notice] = 'Poll Answer was not created.'
        format.html { render :action => "new" }
        
      end
    end
  end

  # PUT /poll_answers/1
  # PUT /poll_answers/1.xml
  def update
    @poll_answer = PollAnswer.find(params[:id])

    respond_to do |format|
      if @poll_answer.update_attributes(params[:poll_answer])
        flash[:notice] = 'PollAnswer was successfully updated.'
        format.html { redirect_to :controller => 'poll', :action => 'index' }
       
     else
        flash[:notice] = 'Poll Answer was not updated.'
        format.html { render :action => "edit" }
       
      end
    end
  end

  # DELETE /poll_answers/1
  # DELETE /poll_answers/1.xml
  def destroy
    @poll_answer = PollAnswer.find(params[:id])
    @poll_answer.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'poll', :action => 'index' }
    
    end
  end
end
