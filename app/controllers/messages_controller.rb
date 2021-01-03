class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def new
  end

  def create
    @messege = Message.new(message_params)
    if @messege.save
      redirect_to messages_path, notice: '投稿しました。'
    else
      redirect_to messages_path, notice: 'メッセージを入力してください。'
    end
  end
end


private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  