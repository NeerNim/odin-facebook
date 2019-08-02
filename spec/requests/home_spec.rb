require 'rails_helper'


RSpec.feature "Static pages", :type => :feature do

  scenario "Visiting the home page" do
    visit "/"
    expect(page).to have_title "OdinFacebook" 
  end

  scenario "Visiting the home page" do
    visit "/"
    expect(page).to have_selector "h1" 
  end

  scenario 'with valid email and password' do
    sign_up_with('john', 'doe', 'johndoe@gmail.com', '123456', '123456', '2019-08-02', 'M')
    expect(page).to have_content('Logout')
  end
end