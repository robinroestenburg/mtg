class AddNumberArtistRarityToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :number, :integer
    add_column :cards, :artist, :string
    add_column :cards, :rarity, :string
  end

  def self.down
    remove_column :cards, :rarity
    remove_column :cards, :artist
    remove_column :cards, :number
  end
end
