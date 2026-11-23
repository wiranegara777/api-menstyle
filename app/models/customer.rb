class Customer < ApplicationRecord
    has_secure_password

    has_many :addresses, class_name: "Customer::Address"

    validates :name, :email, :phone, presence: true
end