class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.datetime :article_date
      t.boolean :published
      t.string :article_title
      t.text :article_body
      t.text :article_tags
      t.integer :user_id
      t.string :attachment_URL
      t.string :attachment_Description
      t.string :attachment_Credits

      t.timestamps
    end
  end
end
