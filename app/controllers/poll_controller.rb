class PollController < ApplicationController
  def index
    @polls = PollQuestion.find(:all)
    @answers = PollAnswer.find(:all)
  end
  
  def show
    @poll_question = PollQuestion.find(params[:id])
    @answers = PollAnswer.find(:all, :conditions => ['poll_question_id = ?', @poll_question.id] )
  end
  
  def create
     @poll = PollQuestion.find(params[:poll_question_id])
     @answer = PollAnswer.find(params[:poll_answer_id])

    respond_to do |format|
      if @poll_player_answer.save
        flash[:notice] = 'PollPlayerAnswer was successfully created.'
        format.html { redirect_to(@poll_player_answer) }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end
  
  def edit
    @poll = PollQuestion.find(params[:id])
    @assigned_answers = PollAnswer.find(:all, :conditions => ['poll_question_id = ?', @poll.id])
    @poll_answers = PollAnswer.find(:all)
  end
  
  def update
    
    @poll_question = PollQuestion.find(params[:id])
    @poll_answer = PollAnswer.find(params[:poll_answer][:id])
    respond_to do |format|
      if @poll_answer.update_attributes(:poll_question_id => params[:id])
        flash[:notice] = 'Your Poll Question / Answer was updated.'
        format.html { redirect_to :controller => 'poll', :action => 'index' }
      
    else
       flash[:notice] = 'Your Poll Question / Answer was NOT updated.'
       format.html { render :action => "edit" }
      
      end
    end
    
  end
  
  def total
    @poll = PollQuestion.find(params[:id])
    @answers = PollAnswer.find(:all, :conditions => {:poll_question_id => @poll.id })
  end
  
end