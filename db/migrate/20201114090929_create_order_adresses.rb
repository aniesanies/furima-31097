class CreateOrderAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_adresses do |t|

      t.timestamps
    end
  end
end
