class ChangeColumnsToDecimalsOnCitizens < ActiveRecord::Migration[7.0]
  def change
    change_column :citizens, :hunger, :decimal
    change_column :citizens, :thirst, :decimal
  end
end
