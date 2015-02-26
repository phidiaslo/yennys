class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name, limit: 140
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :processing_time
      t.integer :view_count, default: 0, null: false
      t.string :status, default: "Pending Approval"
      t.string :slug
      t.references :user, index: true
      t.references :category, index: true
      t.references :subcategory, index: true
      t.references :location, index: true

      t.timestamps null: false
    end
    add_index :listings, :slug, unique: true
    add_foreign_key :listings, :users
    add_foreign_key :listings, :categories
    add_foreign_key :listings, :subcategories
    add_foreign_key :listings, :locations
  end
end
