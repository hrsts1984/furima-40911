class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  #has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_time

  validates :product_name, :description, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 0, message: 'must be other than 0' }
  validates :product_condition_id, numericality: { other_than: 0, message: 'must be other than 0' }
  validates :shipping_cost_id, numericality: { other_than: 0, message: 'must be other than 0' }
  validates :shipping_area_id, numericality: { other_than: 0, message: 'must be other than 0' }
  validates :shipping_time_id, numericality: { other_than: 0, message: 'must be other than 0' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  has_one :purchase, class_name: 'Purchase'


end
