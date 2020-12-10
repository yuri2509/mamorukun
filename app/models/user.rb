class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  validates :nickname, :email,
            presence: true, 
            uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, :encrypted_password,  presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "guest"
      user.encrypted_password = SecureRandom.urlsafe_base64
      user.password = user.encrypted_password
    end
  end
end
