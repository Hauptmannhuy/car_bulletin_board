require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "User authentication", type: :request do
  before do
    post api_user_registration_path, params: {email:"email@mail.com", password: '123456789' }
    @user = User.find_by(email:'email@mail.com')
    @non_authorized_client = User.new(email:'lol@mail.com', password:'123456789')
  end
  context "User is not authenticated " do
    it "when user is trying to post to api/announcements gives status 401" do
      post api_announcements_path, :params => {brand: 'Volkswagen', model: 'model',milleage:444656}
      expect(response).to have_http_status(401)
    end
      it 'when user is trying to get api/announcements gives status 401' do
        get api_announcements_path
        expect(response).to have_http_status(401)
      end
    it 'when non-existing user in database signing in' do
      login(@non_authorized_client)
      expect(response).to have_http_status(401)
    end
    it 'when user gives wrong data for registration gives 422 status' do
      status_codes = []
      emails = ['','email@email.com']
      passwords = ['123456789','789']
      2.times do |i|
        fail_register(emails[i], passwords[i])
        expect(response).to have_http_status(422)
      end
    end
end
context "User is authenticated" do
    it 'when existing in database user is trying to sign in gives status 200 and return proper headers' do
      login(@user)
      expect(response).to have_http_status(200)
  end
  it 'gives you an authentication code if you are an existing user and you satisfy the password' do
    login(@user)
    expect(response.has_header?('access-token')).to eq(true)
  end
  end

  def fail_register(email,pass)
    post api_user_registration_path, :params => {email:email, password:pass}
  end
  def login(object)
    post api_user_session_path, params:  { email: object.email, password: '123456789' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end
end
