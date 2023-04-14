class CreateCustSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :cust_subs do |t|
      t.integer :status, default: 0, null: false
      t.references :customer, foreign_key: true
      t.references :subscription, foreign_key: true
      t.index [:customer_id, :subscription_id], unique: true
    end
  end
end
