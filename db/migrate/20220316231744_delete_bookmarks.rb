class DeleteBookmarks < ActiveRecord::Migration[6.0]
  def change
    drop_table :bookmarks
    add_reference :movies, :list, foreign_key: true
    add_column :lists, :comment, :text
  end
end
