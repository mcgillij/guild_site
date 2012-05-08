class PollPlayerAnswersController < ApplicationController
 
#  def new
#    @poll_player_answer = PollPlayerAnswer.new
#  end
#
# 
#  def edit
#    @poll_player_answer = PollPlayerAnswer.find(params[:id])
#  end
#
# 
#  def create
#    @poll_player_answer = PollPlayerAnswer.new(params[:poll_player_answer])
#
#    respond_to do |format|
#      if @poll_player_answer.save
#        flash[:notice] = 'PollPlayerAnswer was successfully created.'
#        format.html { redirect_to(@poll_player_answer) }
#      
#      else
#        format.html { render :action => "new" }
#      
#      end
#    end
#  end
#
# 
#  def update
#    @poll_player_answer = PollPlayerAnswer.find(params[:id])
#
#    respond_to do |format|
#      if @poll_player_answer.update_attributes(params[:poll_player_answer])
#        flash[:notice] = 'PollPlayerAnswer was successfully updated.'
#        format.html { redirect_to(@poll_player_answer) }
#      
#      else
#        format.html { render :action => "edit" }
#      
#      end
#    end
#  end
#
# 
#  def destroy
#    @poll_player_answer = PollPlayerAnswer.find(params[:id])
#    @poll_player_answer.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(poll_player_answers_url) }
#   
#    end
#  end
end
