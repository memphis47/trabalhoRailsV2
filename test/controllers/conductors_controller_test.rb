require 'test_helper'

class ConductorsControllerTest < ActionController::TestCase
  setup do
    @conductor = conductors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conductors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conductor" do
    assert_difference('Conductor.count') do
      post :create, conductor: { age: @conductor.age, name: @conductor.name }
    end

    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should show conductor" do
    get :show, id: @conductor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conductor
    assert_response :success
  end

  test "should update conductor" do
    patch :update, id: @conductor, conductor: { age: @conductor.age, name: @conductor.name }
    assert_redirected_to conductor_path(assigns(:conductor))
  end

  test "should destroy conductor" do
    assert_difference('Conductor.count', -1) do
      delete :destroy, id: @conductor
    end

    assert_redirected_to conductors_path
  end
end
