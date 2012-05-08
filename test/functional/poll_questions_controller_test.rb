require 'test_helper'

class PollQuestionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_questions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_poll_question
    assert_difference('PollQuestion.count') do
      post :create, :poll_question => { }
    end

    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  def test_should_show_poll_question
    get :show, :id => poll_questions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => poll_questions(:one).id
    assert_response :success
  end

  def test_should_update_poll_question
    put :update, :id => poll_questions(:one).id, :poll_question => { }
    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  def test_should_destroy_poll_question
    assert_difference('PollQuestion.count', -1) do
      delete :destroy, :id => poll_questions(:one).id
    end

    assert_redirected_to poll_questions_path
  end
end
