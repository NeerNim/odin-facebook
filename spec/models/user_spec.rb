require 'rails_helper'

RSpec.describe User, type: :model do
   context 'test user validations' do
      let(:user){User.create(first_name: " ", last_name: "", gender: "", email:'', birthday: "", password: '12') }     
      let(:blank_password){User.create(password: '') }     

      it 'can not have blank first name' do
       expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'can not have blank last name' do
       expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'can not have blank email' do
       expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'can not have blank birthday' do
       expect(user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'can not have blank gender' do
       expect(user.errors.full_messages).to include("Gender can't be blank")
      end

      it 'can not have blank password' do
       expect(blank_password.errors.full_messages).to include("Password can't be blank")
      end

      it 'should have minimum of 6 lenght password' do
       expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'should belong to user' do
        t = User.reflect_on_association(:posts)
        expect(t.macro).to eq(:has_many)
      end

   end

 
end
