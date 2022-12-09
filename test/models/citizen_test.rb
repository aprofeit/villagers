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
  end

  private

  def valid_params
    {
      name: Faker::Name.name
    }
  end
end
