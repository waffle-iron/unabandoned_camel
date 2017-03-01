class RemoveColumnFromBeans < ActiveRecord::Migration[5.0]
  def change
    remove_column :beans, :price
  end
end
