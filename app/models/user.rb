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
