class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :post_date
      t.boolean :published
      t.string :title
      t.text :body
      t.integer :attachments_id
      t.text :tags
      t.integer :user_id
      t.text :slug

      t.timestamps
    end
  end
end
