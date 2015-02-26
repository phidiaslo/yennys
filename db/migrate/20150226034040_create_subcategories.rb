class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :subcategories, :categories
  end
end
