class AddResourceIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :resource_id, :integer

  end
end
