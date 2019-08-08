require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment){FactoryBot.create(:comment, user_id:user.id, post_id:post.id)}
  let(:no_title){FactoryBot.create(:comment, title:nil, user_id:user.id, post_id:post.id)}
  let(:no_body){FactoryBot.create(:comment, body:nil, user_id:user.id, post_id:post.id)}
  let(:user){FactoryBot.create(:user)}
  let(:post){FactoryBot.create(:post, user_id:user.id)}

  context "complete comment details" do
    it "is valid" do
      expect(comment).to be_valid
    end
  end

  context "body is missing" do
    it "is invalid" do
      no_body.valid?
      expect(no_body.errors['body']).to include("Body can't be blank")
    end
  end

  it 'should belong to post' do
    t = Comment.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
