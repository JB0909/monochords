class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :time
      t.string :song_name
      t.string :artist_name
      t.string :body
      t.integer :practicing_id

      t.timestamps
    end
  end
end
