require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
    @board = FactoryBot.build(:board)
  end

  describe '掲示板の投稿' do
    context '掲示板の投稿がうまくいくとき' do
      it 'postが存在すれば登録できる' do
        expect(@board).to be_valid
      end
      it 'postが40文字以下であれば登録できる' do
        @board.post = 'aaaaaaaaaabbbbbbbbbbcccccccccc'
        expect(@board).to be_valid
      end
    end
    context '掲示板の投稿がうまくいかないとき' do
      it 'postが存在しなければ投稿出来ない' do
        @board.post =''
        @board.valid?
        expect(@board.errors.full_messages).to include("Post can't be blank")
      end
      it 'postが31文字以上だと投稿出来ない' do
        @board.post = '1111111111aaaaaaaaaa2222222222k'
        @board.valid?
        expect(@board.errors.full_messages).to include("Post is too long (maximum is 30 characters)")
      end
    end  
  end
end