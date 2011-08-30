class RemoveColorAndRarityFromCard < ActiveRecord::Migration
  def self.up
    remove_column :cards, :rarity
    remove_column :cards, :color
  end

  def self.down
    add_column :cards, :rarity, :string
    add_column :cards, :color, :string
  end
end
