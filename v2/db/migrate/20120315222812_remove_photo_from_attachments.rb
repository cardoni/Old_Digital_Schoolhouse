class RemovePhotoFromAttachments < ActiveRecord::Migration
  def up
    remove_column :attachments, :photo
      end

  def down
    add_column :attachments, :photo, :string
  end
end
