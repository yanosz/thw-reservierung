require 'test_helper'

class TentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tent" do
    assert_difference('Tent.count') do
      post :create, :tent => { }
    end

    assert_redirected_to tent_path(assigns(:tent))
  end

  test "should show tent" do
    get :show, :id => tents(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tents(:one).to_param
    assert_response :success
  end

  test "should update tent" do
    put :update, :id => tents(:one).to_param, :tent => { }
    assert_redirected_to tent_path(assigns(:tent))
  end

  test "should destroy tent" do
    assert_difference('Tent.count', -1) do
      delete :destroy, :id => tents(:one).to_param
    end

    assert_redirected_to tents_path
  end
end
