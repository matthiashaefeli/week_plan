require 'rails_helper'

RSpec.describe UsersController , type: :controller do
  describe 'index' do
    it 'assigns @users and @email_array' do
      get :index
      expect(assigns(:email_array)).to be_kind_of(Array)
      expect(assigns(:users)).to be_kind_of(Object)
    end
  end

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

  describe 'update' do
    it 'updates a user' do
      # create user and check if the updated user value changed
      put :update, params: { info: 'false', id: 1 }
    end
  end
end
