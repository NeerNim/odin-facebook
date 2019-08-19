require 'rails_helper'

RSpec.feature "AddFriends", type: :feature do
  context 'Add a Friend' do
    let!(:user1) { FactoryBot.create :user, first_name: 'John', email: 'john@gmail.com' }
    let!(:user2) { FactoryBot.create :user, first_name: 'Mike', email: 'mike@gmail.com' }

    before(:each) do
      visit user_session_path
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'adding a friend' do
      visit users_path

      click_button 'Add Friend'
      expect(page).to have_text("Friend Request Sent")
    end
  end

  context "friendship requests" do
    let(:user1) { FactoryBot.create :user, first_name: 'John', email: 'john@gmail.com' }
    let(:user2) { FactoryBot.create :user, first_name: 'Mike', email: 'mike@gmail.com' }

    before(:each) do
      user1.friendships.create!(friend: user2)

      visit user_session_path
      within('form') do
        fill_in 'Email', with: 'mike@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end
    scenario 'confirm friendship request' do
      visit notifications_new_path

      expect(page).to have_text("John")      

      click_button 'Confirm'
      visit friendships_path            
      
      expect(page).to have_text("John")
    end

    scenario 'reject friendship request' do
      visit notifications_new_path
      save_and_open_page
      expect(page).to have_text("John")

      click_button 'Reject'

      expect(page).to_not have_text("John")

      visit friendships_path
      expect(page).to_not have_text("John")
    end
  end
end
