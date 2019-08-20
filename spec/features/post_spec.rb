# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  context 'Create Post' do
    before(:each) do
      FactoryBot.create :user, email: 'john@gmail.com', password: '123456', password_confirmation: '123456', gender: 'male', birthday: Date.today
      visit user_session_path
    end

    scenario 'with valid email and password' do
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit new_post_path
      within('form') do
        fill_in 'Title', with: 'Problem with Factory'        
        fill_in 'Content', with: 'To elaborate on what Joe is saying, after_initialize methods are called immediately upon object initialization, and that time indeed user has not been set.'
      end
      click_button 'Create new post'      
    end
  end
end
