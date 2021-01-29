require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  let(:user) { create(:user) }
  let(:message) { create(:message) }
  
  describe "GET#index" do
      context "投稿一覧ページが正しく表示されること" do
      it "200レスポンスが返ってきていること" do
        get messages_url
        expect(response.status).to eq 200
      end
    end

    context '未ログインの状態で' do
      it 'アクセスできる' do
        get messages_url
        expect(response).to be_successful
      end
    end

    context 'ログインユーザーとして' do
      it 'アクセスできる' do
        sign_in user
        get messages_url
        expect(response).to be_successful
      end
    end
  end

  describe 'POST #create' do
    before do
      sign_in user
    end

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post messages_url, params: { message: FactoryBot.attributes_for(:message) }
        expect(response.status).to eq 302
      end

      it 'メッセージが登録されること' do
        expect do
          post messages_url, params: { user: FactoryBot.attributes_for(:message) }
        end
      end

      it 'リダイレクトすること' do
        post messages_url, params: { message: FactoryBot.attributes_for(:message) }
        expect(response).to redirect_to messages_url
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post messages_url, params: { message: FactoryBot.attributes_for(:message, content: nil) }
        expect(response.status).to eq 200
      end

      it '投稿が保存されないこと' do
        expect do
          post messages_url, params: { message: FactoryBot.attributes_for(:message, content: nil) }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in user
    end

    let!(:message) { FactoryBot.create :message }

    it 'リクエストが成功すること' do
      delete message_url message
      expect(response.status).to eq 302
    end

    it '投稿が削除されること' do
      expect do
        delete message_url message
      end
    end

    it 'メッセージ一覧にリダイレクトすること' do
      delete message_url message
      expect(response).to redirect_to messages_url
    end
  end

end
