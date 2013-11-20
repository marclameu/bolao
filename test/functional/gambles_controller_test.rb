require 'test_helper'

class GamblesControllerTest < ActionController::TestCase
  setup do
    @gamble = gambles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gambles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gamble" do
    assert_difference('Gamble.count') do
      post :create, gamble: { integer: @gamble.integer, team_away_score: @gamble.team_away_score, team_home_score: @gamble.team_home_score }
    end

    assert_redirected_to gamble_path(assigns(:gamble))
  end

  test "should show gamble" do
    get :show, id: @gamble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gamble
    assert_response :success
  end

  test "should update gamble" do
    put :update, id: @gamble, gamble: { integer: @gamble.integer, team_away_score: @gamble.team_away_score, team_home_score: @gamble.team_home_score }
    assert_redirected_to gamble_path(assigns(:gamble))
  end

  test "should destroy gamble" do
    assert_difference('Gamble.count', -1) do
      delete :destroy, id: @gamble
    end

    assert_redirected_to gambles_path
  end
end
