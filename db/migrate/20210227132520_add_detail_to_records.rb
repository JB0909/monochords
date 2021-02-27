class AddDetailToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :music_id, :integer
    add_column :records, :image_url, :string
  end
end
