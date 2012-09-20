require 'test_helper'

class FacilitatorsControllerTest < ActionController::TestCase
  setup do
    @facilitator = facilitators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilitators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facilitator" do
    assert_difference('Facilitator.count') do
      post :create, facilitator: {  }
    end

    assert_redirected_to facilitator_path(assigns(:facilitator))
  end

  test "should show facilitator" do
    get :show, id: @facilitator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facilitator
    assert_response :success
  end

  test "should update facilitator" do
    put :update, id: @facilitator, facilitator: {  }
    assert_redirected_to facilitator_path(assigns(:facilitator))
  end

  test "should destroy facilitator" do
    assert_difference('Facilitator.count', -1) do
      delete :destroy, id: @facilitator
    end

    assert_redirected_to facilitators_path
  end
end
