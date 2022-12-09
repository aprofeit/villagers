class Citizen < ApplicationRecord
  def tick
    additional_hunger = 0
    if last_tick_at
      additional_hunger = (DateTime.now.to_f - last_tick_at.to_f) * hunger_per_second
    end

    self.update!(
      hunger: self.hunger += additional_hunger,
      last_tick_at: DateTime.now
    )
  end

  def hunger_per_second
    hunger_per_hour / 60.0 / 60
  end
end
