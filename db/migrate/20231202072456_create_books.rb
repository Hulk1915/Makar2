class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.text :description
      t.date :published_date
      t.string :image_url
      t.float :price

      t.timestamps
    end
  end
end
