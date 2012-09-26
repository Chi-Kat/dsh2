require 'test_helper'

class ServicesOfferedsControllerTest < ActionController::TestCase
  setup do
    @services_offered = services_offereds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services_offereds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create services_offered" do
    assert_difference('ServicesOffered.count') do
      post :create, services_offered: { building_capacity: @services_offered.building_capacity, current_program: @services_offered.current_program, kitchen: @services_offered.kitchen, new_service: @services_offered.new_service }
    end

    assert_redirected_to services_offered_path(assigns(:services_offered))
  end

  test "should show services_offered" do
    get :show, id: @services_offered
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @services_offered
    assert_response :success
  end

  test "should update services_offered" do
    put :update, id: @services_offered, services_offered: { building_capacity: @services_offered.building_capacity, current_program: @services_offered.current_program, kitchen: @services_offered.kitchen, new_service: @services_offered.new_service }
    assert_redirected_to services_offered_path(assigns(:services_offered))
  end

  test "should destroy services_offered" do
    assert_difference('ServicesOffered.count', -1) do
      delete :destroy, id: @services_offered
    end

    assert_redirected_to services_offereds_path
  end
end
