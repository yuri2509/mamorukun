class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  validates :nickname, :email,
            uniqueness: true
  validates :nickname, :email, :password, :encrypted_password,
            presence: true, on: :create
  validates :nickname,
            length: { maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            format: { with: VALID_EMAIL_REGEX }
  validates :password,
            length: { minimum: 6}
  validates :password, confirmation: true

  def self.guest
    find_or_create_by!(email: GUEST_ACCOUNT::GUEST_EMAIL) do |user|
      user.nickname = "guest"
      user.encrypted_password = SecureRandom.urlsafe_base64
      user.password = user.encrypted_password
    end
  end
end
