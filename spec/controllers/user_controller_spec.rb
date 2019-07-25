require 'rails_helper'

RSpec.describe UsersController , type: :controller do
  describe 'new' do
    it 'assigns @user' do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end
  end

  describe 'create' do
    it 'creates user' do
      post :create, params: { user: { email: 'rspec@rsepc.com', password: 'rspec', password_confirmation: 'rspec', user_name: 'rspec' } }
      expect(User.last.user_name).to eq('rspec')
    end

    it 'get error creating user' do
      post :create, params: { user: { email: 'rspec@rsepc.com', password: 'rspec', password_confirmation: 'rspec', user_name: '' } }
      expect(response.request.flash.notice).to eq(["User name can't be blank"])
    end
  end
end
