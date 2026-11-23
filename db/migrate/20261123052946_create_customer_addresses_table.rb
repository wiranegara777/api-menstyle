class CreateCustomerAddressesTable < ActiveRecord::Migration[8.1]
  def change
    create_table :customer_addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :street_address
      t.string :city
      t.string :postal_code
      t.text :note

      t.timestamps
    end
  end
end
