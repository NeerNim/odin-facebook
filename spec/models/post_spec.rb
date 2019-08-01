require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'test post validations' do
    let(:post){Post.create(title:'some title') }

    it 'can not create a post without user_id' do
      expect(post.errors.full_messages).to include("User must exist")
    end
  end
end
