class AddAttachmentAvatarToGames < ActiveRecord::Migration[6.0]
  def self.up
    change_table :games do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :games, :avatar
  end
end
