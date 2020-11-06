class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validate :image_presence
  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :status_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :delivery_pay_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :delivery_area_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :delivery_day_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'は300~9,999,999の間の数値を入力してください'}, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  def image_presence
    unless image.attached?
      errors.add(:image, 'ファイルを添付してください')
    end
  end
end
