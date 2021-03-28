class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :history_date, :date
    add_column :users, :history_date_status, :integer, default: 0, null: false, limit: 1
    add_column :users, :birth_date, :date
    add_column :users, :birth_date_status, :integer, default: 0, null: false, limit: 1
    add_column :users, :sex, :string
    add_column :users, :sex_status, :integer, default: 0, null: false, limit: 1
    add_column :users, :add, :string
    add_column :users, :add_status, :integer, default: 0, null: false, limit: 1
    add_column :users, :blood, :string
    add_column :users, :blood_status, :integer, default: 0, null: false, limit: 1
    add_column :users, :introduction, :string
  end
end
