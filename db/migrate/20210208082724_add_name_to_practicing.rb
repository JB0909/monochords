class AddNameToPracticing < ActiveRecord::Migration[6.0]
  def change
    add_column :practicings, :song_name, :string
    add_column :practicings, :artist_name, :string
  end
end
