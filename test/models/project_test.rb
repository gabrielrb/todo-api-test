require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_valid
    assert projects(:one).valid?
    refute Project.new.valid?
  end
end
