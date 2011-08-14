class AddDescriptionFlavorToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :description, :string
    add_column :cards, :flavor, :string
  end

  def self.down
    remove_column :cards, :flavor
    remove_column :cards, :description
  end
end
