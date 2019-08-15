require 'rails_helper'

RSpec.feature "AddFriends", type: :feature do
  context 'Add a Friend' do
    before(:each) do
      FactoryBot.create :user, email: 'john@gmail.com', password: '123456', password_confirmation: '123456', gender: 'male', birthday: Date.today
      visit user_session_path     
      FactoryBot.create :random_user, email: 'john1@gmail.com', password: '123456', password_confirmation: '123456', gender: 'male', birthday: Date.today
 
    end
      scenario 'with valid email and password' do
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit users_path
      expect(page).to have_link("Send Friend Request")
    end
  end
end
