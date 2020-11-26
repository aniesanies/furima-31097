require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'contentが存在すれば保存できること' do
    expect(@comment).to be_valid
  end

  it 'contentが存在しない場合保存できないこと' do
    @comment.content = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('コメントを入力してください')
  end

  it 'userと紐づいていない場合保存できないこと' do
    @comment.user = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('Userを入力してください')
  end

  it 'itemと紐づいていない場合保存できないこと' do
    @comment.item = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('Itemを入力してください')
  end
end
