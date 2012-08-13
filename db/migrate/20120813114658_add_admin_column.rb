class AddAdminColumn < ActiveRecord::Migration
  def up
    add_column :users, :is_admin, :boolean, :default => 0
  end

  def down
    remove_column :users, :is_admin
  end
end
