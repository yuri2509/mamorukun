class MessagesController < ApplicationController
  before_action :message_destroy_user, only: [:destroy]

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
      redirect_to messages_path, notice: 'メッセージを入力してください。', status: :bad_request
    end
  end

  def destroy
    @message = Message.where(id: params[:id]).first
    if @message.blank?
      return redirect_to(messages_path, alert: "データが見つかりませんでした") 
    else
      @message.destroy
      redirect_to messages_path
    end
  end

private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end


  def message_destroy_user
    unless Message.find(params[:id]).user.id.to_i == current_user.id
      redirect_to messages_path, notice: '投稿ユーザーではないので削除できません。'
    end
  end

end
