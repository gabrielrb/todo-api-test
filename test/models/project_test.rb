require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_valid
    assert projects(:one).valid?
    refute Project.new.valid?
  end
end
