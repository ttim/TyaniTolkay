class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :desc
      t.string :tags
      t.integer :user_id
      t.integer :price

      t.string :tags_for_search

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
