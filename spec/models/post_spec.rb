# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_post) { FactoryBot.build(:post) }
  let(:long_content){FactoryBot.build(:post, content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ") }
  let(:short_title) { FactoryBot.build(:post, title: "adf") }
  let(:content) { FactoryBot.build(:post, content: nil) }
  let(:user_must_exist) { FactoryBot.build(:post) }
  
  context 'complete post details' do
    it 'is valid' do
      expect(valid_post).to be_valid
    end
  end

  context 'long content' do 
    it 'can not have content more than 140 characters' do
      long_content.valid?
      expect(long_content.errors['content']).to include('is too long (maximum is 140 characters)')
    end
  end

  context 'short title' do 
    it 'can not have length less than 10 characters' do
      short_title.valid?
      expect(short_title.errors['title']).to include('is too short (minimum is 10 characters)')
    end
  end

  context 'content' do
    it 'can not have empty content field' do
      content.valid?
      expect(content.errors['content']).to include("can't be blank")
    end
  end

  context 'assoication' do
    it 'should belong to user' do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end

end
