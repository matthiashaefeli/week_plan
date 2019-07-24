require 'rails_helper'

RSpec.describe UsersController do
  describe 'new' do
    it 'assigns @user' do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end
  end
end
