require File.dirname(__FILE__) + '/../test_helper'
require 'edit_controller'

# Re-raise errors caught by the controller.
class EditController; def rescue_action(e) raise e end; end

class EditControllerTest < Test::Unit::TestCase
  def setup
    @controller = EditController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
