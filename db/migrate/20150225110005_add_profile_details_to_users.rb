class AddProfileDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :about, :text
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :role, :string, default: 'Member'
    add_column :users, :country, :string
  end
end
