class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }

  validates :last_name, :first_name, presence: true, format: {
    with: /\A[ぁ-んァ-ヶー々〆〤ヴァ-ヴォ一-龥]+\z/,
    message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
  }

  validates :last_name_kana, :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: 'は全角カタカナで入力してください'
  }

  validates :birthday, presence: true
  has_many :items
end
