class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explain
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_pay_id
      t.integer :delivery_area_id
      t.integer :delivery_day_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end