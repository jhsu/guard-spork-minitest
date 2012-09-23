require 'minitest_helper'

describe "Blank" do
  before do
    @something = false
  end

  it "should test_undone" do
    assert !@something
  end

  it "should test_something_useful" do
    @something = true
    assert @something
  end
end
