class CreateEventEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :event_entries do |t|
      t.integer :event_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
