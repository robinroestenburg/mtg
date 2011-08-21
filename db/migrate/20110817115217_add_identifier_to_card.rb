class AddIdentifierToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :identifier, :integer
  end

  def self.down
    remove_column :cards, :identifier
  end
end
