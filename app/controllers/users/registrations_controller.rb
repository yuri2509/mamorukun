# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :check_guest, only: %i[update destroy]
  # before_action :correct_user,   only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      bypass_sign_in(@user)
      redirect_to root_path, notice: 'ユーザーを登録しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to root_path, notice: 'ユーザー情報を編集しました。'
    else
      render :edit
    end
  end

  # def show
  #   @user = current_user
  # end

  private
  # 正しいユーザーかどうか確認
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user)
  # end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
  
end
