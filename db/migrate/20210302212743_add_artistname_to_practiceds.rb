class AddArtistnameToPracticeds < ActiveRecord::Migration[6.0]
  def change
    add_column :practiceds, :artist_name, :string
  end
end
