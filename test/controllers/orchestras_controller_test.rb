require 'test_helper'

class OrchestrasControllerTest < ActionController::TestCase
  setup do
    @orchestra = orchestras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orchestras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orchestra" do
    assert_difference('Orchestra.count') do
      post :create, orchestra: { city: @orchestra.city, conductor_id: @orchestra.conductor_id, name: @orchestra.name }
    end

    assert_redirected_to orchestra_path(assigns(:orchestra))
  end

  test "should show orchestra" do
    get :show, id: @orchestra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orchestra
    assert_response :success
  end

  test "should update orchestra" do
    patch :update, id: @orchestra, orchestra: { city: @orchestra.city, conductor_id: @orchestra.conductor_id, name: @orchestra.name }
    assert_redirected_to orchestra_path(assigns(:orchestra))
  end

  test "should destroy orchestra" do
    assert_difference('Orchestra.count', -1) do
      delete :destroy, id: @orchestra
    end

    assert_redirected_to orchestras_path
  end
end
