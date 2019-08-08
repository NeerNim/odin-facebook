require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user){FactoryBot.create(:user)}
  let(:post){FactoryBot.create(:post, user_id:user.id)}
  let(:comment){FactoryBot.create(:comment, user_id:user.id, post_id:post.id)}


  context "complete comment details" do
    it "is valid" do
      expect(comment).to be_valid
    end
  end

  context "comment belongs to post" do
    it "is invalid" do
      t = Comment.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
