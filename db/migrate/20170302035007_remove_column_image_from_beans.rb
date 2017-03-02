class RemoveColumnImageFromBeans < ActiveRecord::Migration[5.0]
  def change
    remove_column :beans, :image_uid
  end
end
