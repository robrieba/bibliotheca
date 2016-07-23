class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :branch
      t.string :location
      t.text :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
