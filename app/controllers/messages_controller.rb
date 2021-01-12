class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all.order(created_at: :desc)

  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: '投稿しました。'
    else
      redirect_to messages_path, notice: 'メッセージを入力してください。'
    end
  end
end

def delete
  byebug
  @message = Message.find_by(params[:id])
  @message.destroy

  redirect_to messages_path
end

def destroy
  byebug
  @message = Message.find_by(params[:id])
  @message.destroy

  redirect_to messages_path
end

private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
