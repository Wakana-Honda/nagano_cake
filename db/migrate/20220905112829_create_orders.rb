class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer:customer_id
      t.string:postal_code
      t.string:adress
      t.string:name
      t.integer:shopping_cost
      t.integer:total_payment
      t.integer:status
      t.timestamps
    end
  end
end
