require 'test_helper'

class IntegrantsControllerTest < ActionController::TestCase
  setup do
    @integrant = integrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:integrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create integrant" do
    assert_difference('Integrant.count') do
      post :create, integrant: { conductor_id: @integrant.conductor_id, instrument_id: @integrant.instrument_id, nome: @integrant.nome, orchestra_id: @integrant.orchestra_id }
    end

    assert_redirected_to integrant_path(assigns(:integrant))
  end

  test "should show integrant" do
    get :show, id: @integrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @integrant
    assert_response :success
  end

  test "should update integrant" do
    patch :update, id: @integrant, integrant: { conductor_id: @integrant.conductor_id, instrument_id: @integrant.instrument_id, nome: @integrant.nome, orchestra_id: @integrant.orchestra_id }
    assert_redirected_to integrant_path(assigns(:integrant))
  end

  test "should destroy integrant" do
    assert_difference('Integrant.count', -1) do
      delete :destroy, id: @integrant
    end

    assert_redirected_to integrants_path
  end
end
