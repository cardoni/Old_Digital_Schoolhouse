class ChangeName < ActiveRecord::Migration
def change
rename_column :attachments, :post_id, :article_id

end
end
