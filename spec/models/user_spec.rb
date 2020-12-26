require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "nicknameが20文字以下であれば登録できること" do
      user = build(:user, nickname: "abeabeabeabeabeabeab")
      user.valid?
      expect(user).to be_valid
    end

    # 4
    it "nicknameが21文字以上の場合は登録できないこと" do
      user = build(:user, nickname: "abeabeabeabeabeabeabe")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    # 5
    it "重複したnicknameが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    # 6
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 7
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 8
    it "emailが正しくない場合は登録できないこと" do
      user = build(:user, email: "kkk@gmail")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 9
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 10
    it "passwordが5文字以下の場合は登録できないこと" do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    # 11
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end
  end
end
