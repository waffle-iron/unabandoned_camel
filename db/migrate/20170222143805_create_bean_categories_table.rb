class CreateBeanCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bean_categories do |t|
      t.references :bean, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
