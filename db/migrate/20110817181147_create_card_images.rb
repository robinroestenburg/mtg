class CreateCardImages < ActiveRecord::Migration
  def self.up
    create_table :card_images do |t|
      t.integer :size
      t.binary :data
      t.string :content_type

      t.timestamps
    end
  end

  def self.down
    drop_table :card_images
  end
end
