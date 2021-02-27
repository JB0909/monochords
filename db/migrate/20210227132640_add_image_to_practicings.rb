class AddImageToPracticings < ActiveRecord::Migration[6.0]
  def change
    add_column :practicings, :image_url, :string
  end
end
