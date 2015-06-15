class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :topic, index: true
      t.references :user, index: true
      t.string :url

      t.timestamps null: false
    end
    add_foreign_key :bookmarks, :topics
    add_foreign_key :bookmarks, :users
  end
end
