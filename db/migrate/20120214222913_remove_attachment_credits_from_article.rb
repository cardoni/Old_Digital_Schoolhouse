class RemoveAttachmentCreditsFromArticle < ActiveRecord::Migration

  def change
    remove_column :articles, :attachment_Description
    remove_column :articles, :attachment_Credits
    remove_column :articles, :slug
  end
end
