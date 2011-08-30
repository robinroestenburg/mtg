class CreateRarities < ActiveRecord::Migration
  def self.up
    create_table :rarities do |t|
      t.string :identifier
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :rarities
  end
end
