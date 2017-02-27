require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'should validate email presence' do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to_not be_valid
    end

    it 'should validate email uniqueness' do
      user = FactoryGirl.create(:user, email: 'email')
      user2 = FactoryGirl.build(:user, email: 'email')

      expect(user2).to_not be_valid
    end

    it 'should validate password presence' do
      user = FactoryGirl.build(:user, password: nil)

      expect(user).to_not be_valid
    end
  end

  context 'relationships' do
    it 'has many links' do
      user = FactoryGirl.build(:user)

      expect(user).to respond_to(:links)
    end
  end
end
