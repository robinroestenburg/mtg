class AddColorIdAndRarityIdToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :color_id, :integer
    add_column :cards, :rarity_id, :integer
  end

  def self.down
    remove_column :cards, :rarity_id
    remove_column :cards, :color_id
  end
end
