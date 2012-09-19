require 'test_helper'

class ThemeSuggestionsControllerTest < ActionController::TestCase
  setup do
    @theme_suggestion = theme_suggestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theme_suggestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theme_suggestion" do
    assert_difference('ThemeSuggestion.count') do
      post :create, theme_suggestion: { name: @theme_suggestion.name, user_id: @theme_suggestion.user_id }
    end

    assert_redirected_to theme_suggestion_path(assigns(:theme_suggestion))
  end

  test "should show theme_suggestion" do
    get :show, id: @theme_suggestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theme_suggestion
    assert_response :success
  end

  test "should update theme_suggestion" do
    put :update, id: @theme_suggestion, theme_suggestion: { name: @theme_suggestion.name, user_id: @theme_suggestion.user_id }
    assert_redirected_to theme_suggestion_path(assigns(:theme_suggestion))
  end

  test "should destroy theme_suggestion" do
    assert_difference('ThemeSuggestion.count', -1) do
      delete :destroy, id: @theme_suggestion
    end

    assert_redirected_to theme_suggestions_path
  end
end
