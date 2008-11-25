require File.dirname(__FILE__) + '/../test_helper'

class ConsentTest < Test::Unit::TestCase
  include AuthenticatedTestHelper
  fixtures :consents, :children, :consent_reasons
  
  def test_child_id_updated_when_consented
    #assert_not_nil consents(:consented).child.child_id
  end
  
  def test_requirement_and_format_of_phase
    consent = consents(:phase_missing)
    consent.save
    
    assert_not_nil consent.errors.on(:phase)
  end
  
  def test_if_consented_reason_is_consented
    consent = consents(:consented)
    assert_equal consent.reason, "Consented"
  end
  
  def test_consented_sets_consented_reason_id
    #consent = Consent.create(:phase => 1, :caregiver_id => 1, :consented => true)
    #assert_equal 1, consent.consent_reason_id
  end
end

