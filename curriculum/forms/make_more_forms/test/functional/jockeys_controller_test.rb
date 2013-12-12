require 'test_helper'

class JockeysControllerTest < ActionController::TestCase
  setup do
    @jockey = jockeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jockeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jockey" do
    assert_difference('Jockey.count') do
      post :create, jockey: { height: @jockey.height, name: @jockey.name, shoe_size: @jockey.shoe_size }
    end

    assert_redirected_to jockey_path(assigns(:jockey))
  end

  test "should show jockey" do
    get :show, id: @jockey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jockey
    assert_response :success
  end

  test "should update jockey" do
    put :update, id: @jockey, jockey: { height: @jockey.height, name: @jockey.name, shoe_size: @jockey.shoe_size }
    assert_redirected_to jockey_path(assigns(:jockey))
  end

  test "should destroy jockey" do
    assert_difference('Jockey.count', -1) do
      delete :destroy, id: @jockey
    end

    assert_redirected_to jockeys_path
  end
end
