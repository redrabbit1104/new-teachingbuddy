require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの投稿' do
    context 'メッセージの投稿がうまくいく場合' do
      it 'メッセージがあれば投稿できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージの投稿ができない場合' do
      it 'contentがなければ登録できない' do
        @message.content = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐づいてなければ登録できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
      it 'roomが紐づいてなければ登録できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end