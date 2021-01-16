require 'rails_helper'

describe Message do
  describe '#create' do
    # 1
    it "contentがあればimageがなくても投稿できること" do
      message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end

    # 2
    it "contentとimageの両方があっても投稿できること" do
      message = build(:message)
      expect(message).to be_valid
    end

    # 3
    it "contentがない場合は投稿できないこと" do
      message = build(:message, content: nil)
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end
  end
end
