# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_post) { FactoryBot.build(:post) }
  let(:long_content){FactoryBot.build(:post, content:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ") }
  let(:short_title) { FactoryBot.build(:post, title: "adf") }
  let(:content) { FactoryBot.build(:post, content: nil) }
  let(:user_must_exist) { FactoryBot.build(:post) }
  
  context 'complete post details' do
    it {
      expect(valid_post).to be_valid
    }
  end

  context 'long content' do 
    it {
      long_content.valid?
      expect(long_content.errors['content']).to include('is too long (maximum is 140 characters)')
    }
  end

  context 'short title' do 
    it {
      short_title.valid?
      expect(short_title.errors['title']).to include('is too short (minimum is 10 characters)')
    }
  end

  context 'content' do
    it {
      content.valid?
      expect(content.errors['content']).to include("can't be blank")
    }
  end

  context 'assoication' do
    it {
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    }
  end

end
