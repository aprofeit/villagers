class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :name, null: false
      t.integer :age, null: false, default: 0
      t.integer :hunger, null: false, default: 0
      t.integer :thirst, null: false, default: 0

      t.timestamps
    end
  end
end
