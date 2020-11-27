class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  


  validates :nickname, :email,
            presence: true, 
            uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
  validates :password, :encrypted_password,  presence: true

end
