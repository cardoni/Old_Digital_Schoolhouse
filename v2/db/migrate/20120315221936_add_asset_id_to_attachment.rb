class AddAssetIdToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :asset_id, :integer

  end
end
