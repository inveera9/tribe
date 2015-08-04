class RenameColumnInUser < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :fname
  	add_column :users, :mname, :string
  	add_column :users, :lname, :string
  end
end
