require 'test_helper'

class TrophiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:trophies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_trophy
    assert_difference('Trophy.count') do
      post :create, :trophy => { }
    end

    assert_redirected_to trophy_path(assigns(:trophy))
  end

  def test_should_show_trophy
    get :show, :id => trophies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => trophies(:one).id
    assert_response :success
  end

  def test_should_update_trophy
    put :update, :id => trophies(:one).id, :trophy => { }
    assert_redirected_to trophy_path(assigns(:trophy))
  end

  def test_should_destroy_trophy
    assert_difference('Trophy.count', -1) do
      delete :destroy, :id => trophies(:one).id
    end

    assert_redirected_to trophies_path
  end
end
