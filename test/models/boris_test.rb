require 'test_helper'

class BorisTest < ActiveSupport::TestCase
  fixtures :all

  test "yes not running" do
    assert !Boris.where(slug: "yes").first.status, "status returns true when should not be running"
  end

  test "yes starts and stops" do
    assert Boris.where(slug: "yes").first.start
    assert Boris.where(slug: "yes").first.status

    assert Boris.where(slug: "yes").first.status, "was not running"
    assert Boris.where(slug: "yes").first.stop, "stop returned false"
  end
end
