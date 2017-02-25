class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :contents
      t.references :user, foreign_key: true
      t.integer :total_price
      t.string :status, default: 'Ordered'
      t.timestamps
    end
  end
end
