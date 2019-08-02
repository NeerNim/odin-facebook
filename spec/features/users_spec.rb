# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'User Sign Up' do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
        fill_in 'Birthday', with: '12-12-1990'
        choose('male')
      end
    end

    scenario 'with valid input form fields' do
      click_button 'Sign up'
      expect(page).to have_content('Logout')
    end

    scenario 'with invalid input form fields' do
      within('form') do
        fill_in 'First name', with: ''
      end
      click_button 'Sign up'
      expect(page).to have_content('First name can\'t be blank')
    end

    scenario 'with invalid input form fields' do
      within('form') do
        fill_in 'First name', with: ''
        fill_in 'Last name', with: ''
        fill_in 'Email', with: ''
        fill_in 'Password', with: ''
      end
      click_button 'Sign up'
      expect(page).to have_content('First name can\'t be blank')
      expect(page).to have_content('Last name can\'t be blank')
      expect(page).to have_content('Email can\'t be blank')
    end
  end

  context 'User Sign In' do
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
      expect(page).to have_content('Logged in as john@gmail.com')
    end
  end

  context 'User Sign Out' do
    before(:each) do
      FactoryBot.create :user, email: 'john@gmail.com', password: '123456', password_confirmation: '123456', gender: 'male', birthday: Date.today
      visit user_session_path
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
click_on 'Logout'
    end

    scenario 'with valid email and password' do
      expect(page).to have_content('Signed out successfully')
    end
  end
end
