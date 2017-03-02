class AddColumnImageToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :image, :string
  end
end
