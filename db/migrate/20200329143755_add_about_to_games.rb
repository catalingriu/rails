class AddAboutToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :about, :text
  end
end
