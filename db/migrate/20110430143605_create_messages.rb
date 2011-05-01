class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :text
      t.integer :user_id
      t.integer :message_id
      t.integer :ad_id
      t.integer :reply_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
