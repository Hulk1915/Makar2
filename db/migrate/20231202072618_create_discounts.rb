class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :code
      t.integer :percentage
      t.date :expiration_date

      t.timestamps
    end
  end
end
