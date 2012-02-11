class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :type
      t.string :URL
      t.string :description
      t.integer :post_id
      t.string :Credits

      t.timestamps
    end
  end
end
