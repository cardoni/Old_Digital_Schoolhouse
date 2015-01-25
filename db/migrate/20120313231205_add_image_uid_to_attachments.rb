class AddImageUidToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :image_uid, :string

  end
end
