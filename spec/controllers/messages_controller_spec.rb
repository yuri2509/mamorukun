require 'rails_helper'

RSpec.describe "MessagesController", type: :request do
  let(:user) { create(:user) }
  let(:message) { create(:message) }
  
  describe "GET#index" do
    context "ログインしていないこと" do
      it "正常なレスポンスであること" do
        get messages_url
        expect(response).to be_successful
      end
      it "200レスポンスが返ってきていること" do
        get messages_url
        expect(response).to have_http_status "200"
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

        it '@messageに期待した値が入っていること' do
          expect(assigns(:message)).to be_a_new(Message)
        end

        it "@messagesに正しい値が入っていること" do
          messages = create_list(:message, 3) 
          # expect(assigns(:messages)).to eq messages
          expect(assigns(:messages)).to match(messages.sort{ |a, b| b.created_at <=> a.created_at } )
          # expect(assigns(:messages).attributes).to eq(blank_message.attributes)
        end

        it 'メッセージが正しく表示されていること' do
          expect(response.message).to include(message)
        end
      end
    end
  end

  describe '#create' do
    let(:params) { { user_id: user.id, message: attributes_for(:message) } }

    context 'ログインしている場合' do
      before do
        sign_in user
        get messages_path
      end

      # context '保存に成功した場合' do
      #   subject {
      #     post :create,
      #     params: params
      #   }

      it '新規投稿できない' do
        expect(response).to redirect_to messages_path
      end
        
        it 'messageを保存すること' do
          expect{ subject }.to change(Message, :count).by(1)
        end

        it 'group_messages_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(messages_path)
        end
      end

    #   context '保存に失敗した場合' do
    #     let(:invalid_params) { { user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }

    #     subject {
    #       post :create,
    #       params: invalid_params
    #     }

    #     it 'messageを保存しないこと' do
    #       expect{ subject }.not_to change(Message, :count)
    #     end

    #     it 'index.html.hamlに遷移すること' do
    #       subject
    #       expect(response).to render_template :index
    #     end
    #   end
    # end
  end

end
