class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :second_name, :string
    add_column :users, :birthday, :date
    add_column :users, :photo, :string
  end
end
