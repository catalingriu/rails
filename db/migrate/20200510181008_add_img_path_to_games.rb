class AddImgPathToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :img_path, :string
  end
end
