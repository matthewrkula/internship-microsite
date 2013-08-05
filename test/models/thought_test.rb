require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create one" do
  	thought = Thought.new(text: "This is a passing test")
  	assert thought.valid?
  end

  test "should not be valid without text" do
  	thought = Thought.new()
  	assert thought.valid? == false
  end

  test "should not be valid, text too short" do
  	thought = Thought.new(text: "abc")
  	assert thought.valid? == false
  end

  test "should not be valid, text too long" do
  	str = ""
  	141.times { str << "a" }
  	thought = Thought.new(text: str)
  	assert thought.valid? == false
  end
end
