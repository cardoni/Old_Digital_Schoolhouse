class AddProviderToAttachment < ActiveRecord::Migration
  def change
    rename_column :attachments, :type, :provider
  end
end