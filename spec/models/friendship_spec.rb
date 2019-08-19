# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:random_user) { FactoryBot.create(:random_user) }
  let(:friendship){FactoryBot.create(:friendship, user_id:user.id, friend_id:random_user.id)}

  context "valid friendship" do
    it { expect(friendship.valid?).to eq(true)}
  end

  context "user" do
    it { should belong_to(:user)}
  end

  context "friend" do
    it { should belong_to(:friend)}
  end

  context 'validates user and friend' do 
     it { should validate_presence_of(:user_id) }
     it { should validate_presence_of(:friend_id) }
  end

  context 'validates ' do 
    subject { friendship }
     it { should validate_uniqueness_of(:user_id).case_insensitive.scoped_to(:friend_id) }
  end

end
