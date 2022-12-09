require "test_helper"

class CitizenTest < ActiveSupport::TestCase
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

  private

  def valid_params
    {
      name: Faker::Name.name
    }
  end
end
