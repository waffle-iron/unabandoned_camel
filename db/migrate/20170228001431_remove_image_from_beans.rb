class RemoveImageFromBeans < ActiveRecord::Migration[5.0]
  def change
    remove_column :beans, :image
  end
end
