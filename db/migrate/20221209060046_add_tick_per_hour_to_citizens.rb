class AddTickPerHourToCitizens < ActiveRecord::Migration[7.0]
  def change
    add_column :citizens, :hunger_per_hour, :integer, null: false, default: 1
    add_column :citizens, :thirst_per_hour, :integer, null: false, default: 2
  end
end
