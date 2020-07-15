class CreateUzebbaTerminals < ActiveRecord::Migration[5.1]
  def change
    create_table :uzebba_terminals do |t|
      t.decimal :memory_usage
      t.integer :cpu_usage

      t.timestamps
    end
  end
end
