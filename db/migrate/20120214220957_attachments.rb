class Attachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :media_type
      t.integer :post_id
      t.integer :media_id
      end
    end
end
