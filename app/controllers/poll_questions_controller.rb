class PollQuestionsController < ApplicationController
  # GET /poll_questions/new
  # GET /poll_questions/new.xml
  def new
    @poll_question = PollQuestion.new

  
  end

  # GET /poll_questions/1/edit
  def edit
    @poll_question = PollQuestion.find(params[:id])
    @answers = PollAnswer.find(:all, :conditions => ['poll_question_id = ?', @poll_question.id])
  end

  # POST /poll_questions
  # POST /poll_questions.xml
  def create
    @poll_question = PollQuestion.new(params[:poll_question])

    respond_to do |format|
      if @poll_question.save
        flash[:notice] = 'PollQuestion was successfully created.'
        format.html { redirect_to (:controller => 'poll', :action => 'index') }        
      else
        flash[:notice] = 'PollQuestion was NOT created.'
        format.html { render :action => "new" }
        
      end
    end
  end

  # PUT /poll_questions/1
  # PUT /poll_questions/1.xml
  def update
    @poll_question = PollQuestion.find(params[:id])

    respond_to do |format|
      if @poll_question.update_attributes(params[:poll_question])
        flash[:notice] = 'Poll Question was successfully updated.'
        format.html { redirect_to(:controller => 'poll', :action => 'index') }
     
   else
        flash[:notice] = 'Poll Question was not updated.'
        format.html { render :action => "edit" }
       
      end
    end
  end

  # DELETE /poll_questions/1
  # DELETE /poll_questions/1.xml
  def destroy
    @poll_question = PollQuestion.find(params[:id])
    @poll_question.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'poll', :action => 'index' }
     
    end
  end
end
