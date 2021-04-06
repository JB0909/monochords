class AddTimeMinutesToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :time_minutes, :integer
  end
end
