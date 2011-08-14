class AddCostStrengthToughnessCategoryToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :cost, :integer
    add_column :cards, :strength, :integer
    add_column :cards, :toughness, :integer
    add_column :cards, :category, :string
  end

  def self.down
    remove_column :cards, :category
    remove_column :cards, :toughness
    remove_column :cards, :strength
    remove_column :cards, :cost
  end
end
