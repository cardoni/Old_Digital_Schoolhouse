class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :type
      t.string :attachment_url
      t.text :description
      t.string :copyright_info
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
