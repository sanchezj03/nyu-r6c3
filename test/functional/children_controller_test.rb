require File.dirname(__FILE__) + '/../test_helper'
require 'children_controller'

# Re-raise errors caught by the controller.
class ChildrenController; def rescue_action(e) raise e end; end

class ChildrenControllerTest < Test::Unit::TestCase
  fixtures :children

  def setup
    @controller = ChildrenController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = children(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:children)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:child)
    assert assigns(:child).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:child)
  end

  def test_create
    num_children = Child.count

    post :create, :child => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_children + 1, Child.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:child)
    assert assigns(:child).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Child.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Child.find(@first_id)
    }
  end
end
