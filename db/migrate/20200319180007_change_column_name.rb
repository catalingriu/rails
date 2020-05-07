class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :descrptio, :quantity
  end
end
