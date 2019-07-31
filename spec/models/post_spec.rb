require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'test post validations' do
    # user = User.first
    post = Post.create(title:'some title',user_id:1) 
    it 'can not have blank content' do
      expect(post).to eq(false)
    end
  end
end
