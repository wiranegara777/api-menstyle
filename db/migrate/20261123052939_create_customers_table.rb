class CreateCustomersTable < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :phone, index: { unique: true }
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end
  end
end
