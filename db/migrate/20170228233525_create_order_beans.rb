class CreateOrderBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :order_beans do |t|
      t.references :order, foreign_key: true
      t.references :bean, foreign_key: true
      t.integer :quantity
      t.float :price
      t.float :subtotal
      t.string :item_title

      t.timestamps
    end
  end
end
