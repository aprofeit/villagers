require 'test_helper'

class TickJobTest < Minitest::Test
  def test_tick
    TickJob.new.perform
  end
end
