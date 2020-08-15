class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

 with_options presence: true do
  validates :nickname, uniqueness: { case_sensitive: true }
  validates :email
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/	}
  validates :f_furigana, format: { with: /\A[ァ-ヶー－]+\z/	}
  validates :l_furigana, format: { with: /\A[ァ-ヶー－]+\z/	}
  validates :birthday
 end
end
