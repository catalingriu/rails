class ChangePlatformToBeArrayInGames < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :platform, :string, default: [].to_yaml, array: true
  end
end
