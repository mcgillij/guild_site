require 'test_helper'

class PollAnswersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_answers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_poll_answer
    assert_difference('PollAnswer.count') do
      post :create, :poll_answer => { }
    end

    assert_redirected_to poll_answer_path(assigns(:poll_answer))
  end

  def test_should_show_poll_answer
    get :show, :id => poll_answers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => poll_answers(:one).id
    assert_response :success
  end

  def test_should_update_poll_answer
    put :update, :id => poll_answers(:one).id, :poll_answer => { }
    assert_redirected_to poll_answer_path(assigns(:poll_answer))
  end

  def test_should_destroy_poll_answer
    assert_difference('PollAnswer.count', -1) do
      delete :destroy, :id => poll_answers(:one).id
    end

    assert_redirected_to poll_answers_path
  end
end
