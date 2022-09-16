class RenamePaymentColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders,:payment,:payment_method
  end
end
