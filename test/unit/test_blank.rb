require 'test_helper'
class BlankTest < MiniTest::Unit::TestCase
  def setup
    @something = false
  end

  def test_undone
    assert !@something
  end

  def test_something_useful
    @something = true
    assert @something
  end
end
