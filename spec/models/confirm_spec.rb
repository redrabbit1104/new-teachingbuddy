require 'rails_helper'

RSpec.describe Confirm, type: :model do
  before do
    @confirm = FactoryBot.build(:check)
  end

  describe 'スケジュールを承認' do
    context 'スケジュールの承認がうまくいく場合' do
      it 'checkが存在すれば承認できる' do
        expect(@confirm).to be_valid
      end
      it 'チェックボックスのcheckを外せば削除できる' do
        @confirm.check = '0'
        expect(@confirm).to be_valid
      end
    end
    context 'スケジュールの承認ができない場合' do
      it 'userが紐づいでなければ登録できない' do
        @confirm.user = nil
        @confirm.valid?
        expect(@confirm.errors.full_messages).to include("User must exist")
      end
      it 'scheduleが紐づいでなければ登録できない' do
        @confirm.schedule = nil
        @confirm.valid?
        expect(@confirm.errors.full_messages).to include("Schedule must exist")
      end
    end
  end
end