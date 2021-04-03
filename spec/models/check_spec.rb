require 'rails_helper'

RSpec.describe Check, type: :model do
  before do
    @check = FactoryBot.build(:check)
  end

  describe 'スケジュールのチェック' do
    context 'スケジュールのチェックがうまくいく場合' do
      it 'checkが存在すれば登録できる' do
        expect(@check).to be_valid
      end
      it 'チェックボックスのcheckを外せば削除できる' do
        @check.check = '0'
        expect(@check).to be_valid
      end
    end
    context 'スケジュールのチェックができない場合' do
      it 'userが紐づいでなければ登録できない' do
        @check.user = nil
        @check.valid?
        expect(@check.errors.full_messages).to include("User must exist")
      end
      it 'scheduleが紐づいでなければ登録できない' do
        @check.schedule = nil
        @check.valid?
        expect(@check.errors.full_messages).to include("Schedule must exist")
      end
    end
  end
end