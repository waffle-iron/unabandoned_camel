class AddImagetoBeans < ActiveRecord::Migration[5.0]

  def change
    add_column :beans, :image_uid, :string
  end
end
