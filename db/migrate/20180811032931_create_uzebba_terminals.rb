class CreateUzebbaTerminals < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :uzebba_terminals do |t|
      t.decimal :memory_usage
      t.integer :cpu_usage

      t.timestamps
    end
  end
end
