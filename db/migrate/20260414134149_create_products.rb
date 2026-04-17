class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.integer :price_cents, null: false
      t.integer :stock_level, null: false
      t.datetime :published_at
      t.timestamps
    end
  end
end
