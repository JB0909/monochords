class CreatePracticings < ActiveRecord::Migration[6.0]
  def change
    create_table :practicings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
