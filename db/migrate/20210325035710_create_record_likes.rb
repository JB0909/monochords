class CreateRecordLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :record_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
