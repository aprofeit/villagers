class Citizen < ApplicationRecord
  def tick
    self.update!(last_tick_at: DateTime.now)
  end
end
