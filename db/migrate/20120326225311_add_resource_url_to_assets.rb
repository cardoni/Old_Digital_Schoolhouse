class AddResourceUrlToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :resource_url, :string

  end
end
