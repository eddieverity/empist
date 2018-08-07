class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :item
      t.string :cream
      t.string :sugar
      t.integer :user_id
      t.string :comment
      t.string :status
      t.timestamps
    end
  end
end
