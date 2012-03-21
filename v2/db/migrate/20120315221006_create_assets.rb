class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :image_uid
      t.integer :user_id

      t.timestamps
    end
  end
end
