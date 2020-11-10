class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_pay
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image
  has_one :order

  validate :image_presence
  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :status_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :delivery_pay_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :delivery_area_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :delivery_day_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'は300~9,999,999の間の数値を入力してください' }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  def image_presence
    errors.add(:image, 'ファイルを添付してください') unless image.attached?
  end
end
