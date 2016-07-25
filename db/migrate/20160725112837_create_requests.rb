class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :library, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
