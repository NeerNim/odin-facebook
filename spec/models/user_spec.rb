# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { FactoryBot.build(:user) }
  let(:user_without_first_name) { FactoryBot.build(:user, first_name: nil) }
  let(:user_without_last_name) { FactoryBot.build(:user, last_name: nil) }
  let(:user_without_email) { FactoryBot.build(:user, email: nil) }
  let(:user_without_password) { FactoryBot.build(:user, password: nil) }
  let(:user_without_gender) { FactoryBot.build(:user, gender: nil) }
  let(:user_without_birthday) { FactoryBot.build(:user, birthday: nil) }

  context 'complete user details' do
    it 'is valid' do
      expect(valid_user).to be_valid
    end
  end

  context 'first name is missing' do
    it 'is invalid' do
      user_without_first_name.valid?
      expect(user_without_first_name.errors['first_name']).to include("can't be blank")
    end
  end

  context 'first name is missing' do
    it 'is invalid' do
      user_without_last_name.valid?
      expect(user_without_last_name.errors['last_name']).to include("can't be blank")
    end
  end

  context 'email is missing' do
    it 'is invalid' do
      user_without_email.valid?
      expect(user_without_email.errors['email']).to include("can't be blank")
    end
  end

  context 'password is missing' do
    it 'is invalid' do
      user_without_password.valid?
      expect(user_without_password.errors['password']).to include("can't be blank")
    end
  end

  context 'gender is missing' do
    it 'is invalid' do
      user_without_gender.valid?
      expect(user_without_gender.errors['gender']).to include("can't be blank")
    end
  end

  context 'birthday is missing' do
    it 'is invalid' do
      user_without_birthday.valid?
      expect(user_without_birthday.errors['birthday']).to include("can't be blank")
    end
  end

  context 'assoication' do
    it 'should belong to user' do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end
  end
end
