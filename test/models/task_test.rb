require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def test_valid
    assert tasks(:one).valid?
    refute Task.new.valid?
  end
end
