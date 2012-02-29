class AddBodyHtmlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :body_html, :text

  end
end
