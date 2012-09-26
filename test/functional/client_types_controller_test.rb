require 'test_helper'

class ClientTypesControllerTest < ActionController::TestCase
  setup do
    @client_type = client_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_type" do
    assert_difference('ClientType.count') do
      post :create, client_type: { LGBTQ: @client_type.LGBTQ, LGBTQ: @client_type.LGBTQ, adult: @client_type.adult, children: @client_type.children, disabled: @client_type.disabled, environment: @client_type.environment, families: @client_type.families, health: @client_type.health, homeless: @client_type.homeless, immigrant: @client_type.immigrant, military: @client_type.military, num_: @client_type.num_, num_adult: @client_type.num_adult, num_child: @client_type.num_child, num_disabled: @client_type.num_disabled, num_environment: @client_type.num_environment, num_families: @client_type.num_families, num_health: @client_type.num_health, num_homeless: @client_type.num_homeless, num_immigrant: @client_type.num_immigrant, num_military: @client_type.num_military, num_offender: @client_type.num_offender, num_senior: @client_type.num_senior, num_young_adult: @client_type.num_young_adult, offender: @client_type.offender, population: @client_type.population, purpose: @client_type.purpose, senior: @client_type.senior, young_adult: @client_type.young_adult }
    end

    assert_redirected_to client_type_path(assigns(:client_type))
  end

  test "should show client_type" do
    get :show, id: @client_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_type
    assert_response :success
  end

  test "should update client_type" do
    put :update, id: @client_type, client_type: { LGBTQ: @client_type.LGBTQ, LGBTQ: @client_type.LGBTQ, adult: @client_type.adult, children: @client_type.children, disabled: @client_type.disabled, environment: @client_type.environment, families: @client_type.families, health: @client_type.health, homeless: @client_type.homeless, immigrant: @client_type.immigrant, military: @client_type.military, num_: @client_type.num_, num_adult: @client_type.num_adult, num_child: @client_type.num_child, num_disabled: @client_type.num_disabled, num_environment: @client_type.num_environment, num_families: @client_type.num_families, num_health: @client_type.num_health, num_homeless: @client_type.num_homeless, num_immigrant: @client_type.num_immigrant, num_military: @client_type.num_military, num_offender: @client_type.num_offender, num_senior: @client_type.num_senior, num_young_adult: @client_type.num_young_adult, offender: @client_type.offender, population: @client_type.population, purpose: @client_type.purpose, senior: @client_type.senior, young_adult: @client_type.young_adult }
    assert_redirected_to client_type_path(assigns(:client_type))
  end

  test "should destroy client_type" do
    assert_difference('ClientType.count', -1) do
      delete :destroy, id: @client_type
    end

    assert_redirected_to client_types_path
  end
end
