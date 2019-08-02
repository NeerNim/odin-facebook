module SessionHelpers
  def sign_up_with(first_name, last_name, email, password, password_confirmation, birthday, gender)
    visit 'users/sign_up'
    fill_in 'Email', with: first_name
    fill_in 'Password', with: last_name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Email', with: password_confirmation
    fill_in 'Password', with: birthday
    fill_in 'Password', with: gender
    click_button 'Sign up'
  end
end