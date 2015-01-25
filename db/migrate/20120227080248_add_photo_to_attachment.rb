class AddPhotoToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :photo, :string

  end
end
