requie 'rails-helper'
RSpec.describe UsersController, type: => :controller do
  describe 'Test Users Controller' do
    before(:each) do
      @user = User.create(username:'test', email: 'test-controller@example.com', password: 'test')
      @token = Auth.create_token(@user)
    end
    it "creates user with valid credentials" do
      post :create, params: {username:'test', email: 'test-controller@example.com', password: 'test'}
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('aplication/json; charset=utf-8')
      expect(JSON.parse(response.body)["token"]).to_not be_nil
    end
    it "fails if user with this email already exists" do
      post :create, params: {username:'test', email: 'test-controller@example.com', password: 'test'}
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('aplication/json; charset=utf-8')
      expect(JSON.parse(response.body)["errors"]).to_not be_nil
      expect(JSON.parse(pesponse.body)["logged-in"]).to be(false)
    end
  end
end
