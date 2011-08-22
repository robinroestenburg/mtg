class CreateManas < ActiveRecord::Migration
  def self.up
    create_table :manas do |t|
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :manas
  end
end
