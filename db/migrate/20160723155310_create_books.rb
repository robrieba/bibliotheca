class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :image_url
      t.string :author
      t.string :publisher
      t.integer :copies
      t.integer :requests
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
