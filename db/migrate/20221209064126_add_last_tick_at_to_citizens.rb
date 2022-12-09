class AddLastTickAtToCitizens < ActiveRecord::Migration[7.0]
  def change
    add_column :citizens, :last_tick_at, :datetime
  end
end
