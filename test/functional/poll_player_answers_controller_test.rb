require 'test_helper'

class PollPlayerAnswersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_player_answers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_poll_player_answer
    assert_difference('PollPlayerAnswer.count') do
      post :create, :poll_player_answer => { }
    end

    assert_redirected_to poll_player_answer_path(assigns(:poll_player_answer))
  end

  def test_should_show_poll_player_answer
    get :show, :id => poll_player_answers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => poll_player_answers(:one).id
    assert_response :success
  end

  def test_should_update_poll_player_answer
    put :update, :id => poll_player_answers(:one).id, :poll_player_answer => { }
    assert_redirected_to poll_player_answer_path(assigns(:poll_player_answer))
  end

  def test_should_destroy_poll_player_answer
    assert_difference('PollPlayerAnswer.count', -1) do
      delete :destroy, :id => poll_player_answers(:one).id
    end

    assert_redirected_to poll_player_answers_path
  end
end
