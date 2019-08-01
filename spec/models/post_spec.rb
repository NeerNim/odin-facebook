require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'test post validations' do
    let(:post){Post.create(title:'test') }
    let(:long_content){Post.create(content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ") }

    it 'can not create a post without user_id' do
      expect(post.errors.full_messages).to include("User must exist")
    end

    it 'can not have empty content field' do
      expect(post.errors.full_messages).to include("Content can't be blank")
    end

    it 'can not have length less than 10 characters' do
      expect(post.errors.full_messages).to include("Title is too short (minimum is 10 characters)")
    end

    it 'can not have content more than 140 characters' do
      expect(long_content.errors.full_messages).to include("Content is too long (maximum is 140 characters)")
    end

    it 'should belong to user' do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
