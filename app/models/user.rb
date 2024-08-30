class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥々]+\z/,
    message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
  }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー々〆〤ヴァ-ヴォ]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }

  validates :last_name, presence: true, format: {
    with: /\A[一-龥]+\z/,
    message: 'は漢字（全角）で入力してください'
  }

  validates :first_name, presence: true, format: {
    with: /\A[一-龥]+\z/,
    message: 'は漢字（全角）で入力してください'
  }

  validates :last_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー]+\z/,
    message: 'は全角カタカナで入力してください'
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー]+\z/,
    message: 'は全角カタカナで入力してください'
  }
  validates :birthday, presence: true
end
