# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:random_user) { FactoryBot.create(:random_user) }
  let(:valid_friendship) { FactoryBot.create(:friendship, user_id: user.id, friend_id: user.id) }
  let(:invalid_friendship) { FactoryBot.create(:friendship, user_id: user.id, friend_id: user.id) }

  let(:user){FactoryBot.create(:user)}
  let(:friendship){FactoryBot.create(:friendship, user_id:user.id, friend_id:random_user.id)}

  context "valid friendship" do
    it {
      expect(friendship.valid?).to eq(true)
    }
  end

  context "belongs_to user" do
    it {
      t = Friendship.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    }
  end
end
