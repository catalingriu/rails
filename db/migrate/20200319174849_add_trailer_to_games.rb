class AddTrailerToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :trailer, :string
  end
end
