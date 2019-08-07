# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing User information', type: :feature do
  context 'update user' do 
    let!(:user) {FactoryBot.create(:user, email: 'john@gmail.com', password: '123456', password_confirmation: '123456')}

    before(:each) do    
      visit user_session_path
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit edit_user_registration_path
      within('#edit_user') do
        fill_in 'First Name', with: 'jane'        
        fill_in 'Current password', with: '123456'
      end
      click_button 'Update'      
    end

    scenario 'with valid email and password' do
      expect(page).to have_content('Your account has been updated successfully')
    end
  end
end
