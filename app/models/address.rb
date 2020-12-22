class Address < ApplicationRecord
  belongs_to :order
  has_one :order_address
end
