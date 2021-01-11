class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション（入力制限）
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  #アソシエーション（親）
  has_many :prototypes
  has_many :comments, dependent: :destroy
end

