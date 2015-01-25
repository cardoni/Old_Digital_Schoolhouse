class AddClassificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :classification, :string
  end
end
