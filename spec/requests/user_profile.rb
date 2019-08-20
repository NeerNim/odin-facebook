require 'rails_helper'


RSpec.describe "User Profile", :type => :request do
  let(:user) { FactoryBot.build(:user) }  
  let(:anouther_user) { FactoryBot.build(:user) }  
  
  it 'display the current user profile' do 
    sign_in user
    get user_path(user.id)
    expect(response).to render_template(:show) 
  end

  it 'display the other user profile' do 
    sign_in anouther_user
    get user_path(anouther_user)
    expect(response).to render_template(:show) 
  end
end