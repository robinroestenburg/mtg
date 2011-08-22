class ChangeOrderToManaOrder < ActiveRecord::Migration
  def self.up
    rename_column :card_manas, :order, :mana_order 
  end

  def self.down
    rename_column :card_manas, :mana_order, :order
  end
end
