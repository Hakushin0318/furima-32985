class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivary_source
  belongs_to :delivary_day

  with_options presence: true do
    validates :name
    validates :details
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_source_id
    validates :delivery_day_id

    with_options inclusion: {in: 300..9999999 } do
      validates :price
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :delivery_source_id
      validates :delivery_day_id
    end
  end
end
