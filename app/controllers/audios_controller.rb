class AudiosController < ApplicationController
  def index
  end
  
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "guest"
      user.encrypted_password = SecureRandom.urlsafe_base64
      user.password = user.encrypted_password
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end
end
