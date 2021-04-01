require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュールの登録' do
    context 'スケジュールの登録がうまくいくと場合' do
      it 'スケジュールが存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
      it 'subjectが25文字以下であれば登録できる' do
        @schedule.subject = '11111aaaaabbbbb11111aaaaa'
        expect(@schedule).to be_valid
      end
    end
    context 'スケジュールの登録がうまくいかない場合' do
      it 'subjectが存在しないと登録できない' do
        @schedule.subject = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Subject can't be blank")
      end
      it 'subjectが26文字以上だと登録できない' do
        @schedule.subject = '11111aaaaabbbbb11111aaaaa1'
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Subject is too long (maximum is 25 characters)")
      end
      it 'start_timeが存在しないと登録できない' do
        @schedule.start_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time can't be blank")
      end
      it 'end_timeが存在しないと登録できない' do
        @schedule.end_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("End time can't be blank")
      end
      it 'sdateが紐づいでなければ登録できない' do
        @schedule.sdate = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Sdate must exist")
      end
    end
  end
end