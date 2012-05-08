class VoteController < ApplicationController
  
  def index
    @poll_questions = PollQuestion.find(:all, :conditions => {:active => true})
    @disabled_poll_questions = PollQuestion.find(:all, :conditions => {:active => false})
  end
  
  def update
    @poll_question = PollQuestion.find(params[:vote][:poll_question_id])
    @poll_answer = PollAnswer.find(params[:answer_id])
    @players_answer = PollPlayerAnswer.find(:all, :conditions => ['poll_question_id = ? AND user_id = ?', @poll_question.id, session[:user_id]])
    
    respond_to do |format|
     
      if @players_answer.size != 0
        flash[:notice] = 'Already voted'
        format.html { redirect_to :controller => 'poll', :action => 'total', :id => @poll_question.id }
      else
        if @poll_answer.update_attributes(:votes => @poll_answer.votes + 1) and @players_answer.empty?
          poll_player_answer = PollPlayerAnswer.new(:poll_question_id => @poll_question.id, :user_id => session[:user_id])
          if poll_player_answer.save
            flash[:notice] = 'Your Poll Question / Answer was updated.'
            format.html { redirect_to :controller => 'poll', :action => 'total', :id => @poll_question.id }
          else
            flash[:notice] = 'There was an error with the poll.'
            format.html { redirect_to :controller => 'poll', :action => 'total', :id => @poll_question.id }
          end
            else
             flash[:notice] = 'Your Poll Answer was NOT updated. You may have already voted on this poll.'
             format.html { redirect_to :controller => 'poll', :action => 'total', :id => @poll_question.id }
        end
      end
    end
  end

end
