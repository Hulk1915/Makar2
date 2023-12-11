class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :biography
      t.date :birth_date
      t.string :website

      t.timestamps
    end
  end
end
