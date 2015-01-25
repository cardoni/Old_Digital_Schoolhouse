class RemoveImageUidFromAttachments < ActiveRecord::Migration
  def up
    remove_column :attachments, :image_uid
      end

  def down
    add_column :attachments, :image_uid, :string
  end
end
