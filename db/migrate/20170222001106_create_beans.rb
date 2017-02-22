class CreateBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :beans do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
