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


end
