class AddIsadminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isadmin, :integer
  end
end
