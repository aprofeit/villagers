require "test_helper"

class CitizenTest < ActiveSupport::TestCase
  def setup
    Timecop.freeze(Date.today)
  end

  def teardown
    Timecop.return
  end

  test "creating a valid citizen" do
    citizen = nil
    assert_difference 'Citizen.count' do
      citizen = Citizen.create!(valid_params)
    end

    assert citizen.name.present?
    assert_equal 0, citizen.age
    assert_equal 0, citizen.hunger
    assert_equal 0, citizen.thirst
    assert_equal 1, citizen.hunger_per_hour
    assert_equal 2, citizen.thirst_per_hour
  end

  test 'ticking updates last_tick_at' do
    citizen = valid_citizen

    assert_nil citizen.last_tick_at

    citizen.tick
    assert_equal Time.zone.now, citizen.last_tick_at
  end

  test 'ticking updates the hunger by the expected amount after 2 hours' do
    citizen = valid_citizen
    citizen.tick

    Timecop.travel(2.hours.from_now) do
      citizen.tick
      assert_in_delta 2, citizen.hunger, 0.000001
    end
  end

  test 'ticking updates the thirst by the expected amount after 3 hours' do
    citizen = valid_citizen
    citizen.tick

    Timecop.travel(3.hours.from_now) do
      citizen.tick
      assert_in_delta 6, citizen.thirst, 0.000001
    end
  end

  private

  def valid_citizen
    @valid_citizen ||= Citizen.create(valid_params)
  end

  def valid_params
    {
      name: Faker::Name.name
    }
  end
end
