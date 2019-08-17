require 'rails_helper'

RSpec.feature "Remove friend", type: :feature do
  let(:user1) { FactoryBot.create :user, first_name: 'John', email: 'john@gmail.com' }
  let(:user2) { FactoryBot.create :user, first_name: 'Mike', email: 'mike@gmail.com' }

  before(:each) do
    user1.friendships.create!(friend: user2, confirmed: false)
    user1.friendships.last.confirm

    visit user_session_path
    within('form') do
      fill_in 'Email', with: 'mike@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
  end

  scenario 'delete friend' do
    visit friendships_path

    expect(page).to have_text("John")

    click_button 'Remove'

    expect(page).to_not have_text("John")
  end
end
