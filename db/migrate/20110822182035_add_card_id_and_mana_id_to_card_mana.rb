class AddCardIdAndManaIdToCardMana < ActiveRecord::Migration
  def self.up
    add_column :card_manas, :card_id, :integer
    add_column :card_manas, :mana_id, :integer
  end

  def self.down
    remove_column :card_manas, :card_id
    remove_column :card_manas, :mana_id
  end
end
