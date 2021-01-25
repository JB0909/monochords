class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :artist_name
      t.string :album_name
      t.string :image_url
      t.string :song_name
      t.string :external_id, :null => false

      t.timestamps
    end
  end
end
