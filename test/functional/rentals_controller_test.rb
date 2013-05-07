require 'test_helper'

class RentalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rentals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rental" do
    assert_difference('Rental.count') do
      post :create, :rental => { }
    end

    assert_redirected_to rental_path(assigns(:rental))
  end

  test "should show rental" do
    get :show, :id => rentals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rentals(:one).to_param
    assert_response :success
  end

  test "should update rental" do
    put :update, :id => rentals(:one).to_param, :rental => { }
    assert_redirected_to rental_path(assigns(:rental))
  end

  test "should destroy rental" do
    assert_difference('Rental.count', -1) do
      delete :destroy, :id => rentals(:one).to_param
    end

    assert_redirected_to rentals_path
  end
end
