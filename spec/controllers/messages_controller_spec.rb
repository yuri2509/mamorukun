require 'rails_helper'

RSpec.describe "MessagesController", type: :request do
  let(:user) { create(:user) }
  let(:message) { create(:message) }

  context "ログインしていないこと" do
    describe "#index" do
      it "正常なレスポンスであること" do
        get messages_url
        expect(response).to be_successful
      end
      it "200レスポンスが返ってきていること" do
        get messages_url
        expect(response).to have_http_status "200"
      end
    end
  end

  context "ログイン済みであること" do
    before do
      sign_in user
    end
    context "投稿一覧ページが正しく表示されること" do
      before do
        get messages_path
      end

      it "正常なレスポンスであること" do
        get messages_url
        expect(response).to be_successful
      end
      it "200レスポンスが返ってきていること" do
        get messages_url
        expect(response).to have_http_status "200"
      end

      it "@messageに正しい値が入っていること" do
        messages = create_list(:message, 3) 
        # expect(assigns(:messages)).to eq messages
        expect(assigns(:messages).attributes).to eq(blank_message.attributes)
      end

      it 'メッセージが正しく表示されていること' do
        expect(response.message).to include(message)

      end
    end
  end



end
