class CreateCardManas < ActiveRecord::Migration
  def self.up
    create_table :card_manas do |t|
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :card_manas
  end
end
