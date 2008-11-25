require File.dirname(__FILE__) + '/../test_helper'

class ChildTest < Test::Unit::TestCase
  fixtures :children
  
  # Last name is required
  def test_last_name_is_required
    assert !children(:last_name_missing).valid?
    assert children(:last_name_missing).errors.on(:last_name)
  end
  
  # First name is required
  def test_first_name_is_required
    assert !children(:first_name_missing).valid?
    assert children(:first_name_missing).errors.on(:first_name)
  end  
  
  def test_generation_of_child_id
    child = children(:validates_minimally)
    Child.destroy_all # Start from a fresh table
    child.save # Save the one we're going to use since we emptied it
    
    assert child.create_child_id()
    assert_equal 630001, child.child_id
  end
  
  def test_validation_of_correct_data
    assert children(:validates).valid?
  end
  
  def test_generation_of_recruitment_id
    assert_equal children(:validates).generate_recruitment_id, children(:validates).id + 63000 
  end
  
  def test_format_of_recruitment_id
    assert_match /63([0-9]{3})/, children(:validates).generate_recruitment_id.to_s
  end 
  
  def test_validation_of_illegal_child_id
    child = children(:invalid_custom_child_id)
    assert !child.valid?
    assert_equal "is invalid", child.errors.on(:child_id)
  end
  
  # Incorrect recruitment_ids spit out an error
  def test_validate_an_incorrect_recruitment_id
    child = children(:validates_minimally)
    child.recruitment_id = 630000001
    assert !child.valid?
    assert_not_nil child.errors.on(:recruitment_id)
  end
  
  # Correct child_id validates properly
  def test_correct_custom_child_id_validates
    child = children(:custom_child_id)
    assert child.valid?
    assert_match /63([0-9]{4})/, child.child_id.to_s
  end
end
