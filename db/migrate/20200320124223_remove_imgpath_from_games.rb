class RemoveImgpathFromGames < ActiveRecord::Migration[6.0]
  def change

    remove_column :games, :imgpath, :string
  end
end
