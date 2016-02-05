require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = create(:user)
  end

  context 'method:' do
    it 'full_name' do
      expect(@user.full_name).to eq('Star Lord')
    end
  end

  describe 'validations' do

    it 'should not be valid without email' do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it 'should not be valid without password' do
      @user.password = nil
      expect(@user).to be_invalid
    end

  end
end