class Citizen < ApplicationRecord
  def tick
    unless last_tick_at
      update!(last_tick_at: DateTime.now)
      return
    end

    additional_hunger = (DateTime.now.to_f - last_tick_at.to_f) * hunger_per_second
    additional_thirst = (DateTime.now.to_f - last_tick_at.to_f) * thirst_per_second

    self.update!(
      hunger: self.hunger += additional_hunger,
      thirst: self.thirst += additional_thirst,
      last_tick_at: DateTime.now
    )
  end

  private

  def hunger_per_second
    hunger_per_hour / 60.0 / 60
  end

  def thirst_per_second
    thirst_per_hour / 60.0 / 60
  end
end
