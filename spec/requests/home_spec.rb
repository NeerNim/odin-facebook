require 'rails_helper'


RSpec.describe "Home page", :type => :request do
  let(:user) { FactoryBot.build(:user) }  
  
  it 'display homepage for signed in users' do 
    sign_in user
    get posts_path
    expect(response).to render_template(:index) 
    
  end

  it 'homepage for authenticated user' do 
    get authenticated_root_path
    expect(response.status).to eql 200 
    expect(response.body).to include("Log in")
  end
  
end