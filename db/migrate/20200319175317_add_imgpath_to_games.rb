class AddImgpathToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :imgpath, :string
  end
end
