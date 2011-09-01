class CreateDictionaries < ActiveRecord::Migration
  def self.up
    create_table :dictionaries do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :dictionaries
  end
end
