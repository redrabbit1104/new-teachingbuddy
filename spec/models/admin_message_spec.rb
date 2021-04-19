require 'rails_helper'

RSpec.describe AdminMessage, type: :model do
  before do
    @admin_messsage = FactoryBot.build(:admin_message)
  end

  describe 'メッセージの投稿' do
    context 'メッセージの投稿がうまくいく場合' do
      it 'メッセージがあれば投稿できる' do
        expect(@admin_message).to be_valid
      end
    end
    context 'メッセージの投稿ができない場合' do
      it 'contentがなければ登録できない' do
        @admin_message.content = nil
        @admin_message.valid?
        expect(@admin_message.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐づいてなければ登録できない' do
        @admin_message.user = nil
        @admin_message.valid?
        expect(@admin_message.errors.full_messages).to include("User must exist")
      end
      it 'adminが紐づいてなければ登録できない' do
        @admin_message.admin = nil
        @messageadmin_message.valid?
        expect(@admin_message.errors.full_messages).to include("Admin must exist")
      end
      it 'admin_roomが紐づいてなければ登録できない' do
        @admin_message.admin_room = nil
        @messageadmin_message.valid?
        expect(@admin_message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end