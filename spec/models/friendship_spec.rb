# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:random_user) { FactoryBot.create(:random_user) }
  let(:valid_friendship) { FactoryBot.create(:friendship, user_id: user.id, friend_id: user.id) }
  let(:invalid_friendship) { FactoryBot.create(:friendship, user_id: user.id, friend_id: user.id) }

  context 'it should be valid' do
    it { expect(valid_friendship).to be_valid }
  end

  context 'friendship belongs to user and friend' do 
  end

  
end
