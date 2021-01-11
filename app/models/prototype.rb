class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # バリデーション（入力制限）
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :image, presence: true
  #
  validates :concept, presence: true
  has_many :comments, dependent: :destroy
end
