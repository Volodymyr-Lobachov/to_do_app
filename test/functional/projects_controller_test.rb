require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @project = projects(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :user_id => @user, :project => @project.attributes
    end

    assert_redirected_to user_project_path(@user, assigns(:project))
  end

  test "should show project" do
    get :show, :user_id => @user, :id => @project.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @project.to_param
    assert_response :success
  end

  test "should update project" do
    put :update, :user_id => @user, :id => @project.to_param, :project => @project.attributes
    assert_redirected_to user_project_path(@user, assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :user_id => @user, :id => @project.to_param
    end

    assert_redirected_to user_projects_path(@user)
  end
end
