require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    it 'should validate url presence' do
      link = Link.new(title: 'the hotness')

      expect(link).to_not be_valid
    end

    it 'should validate url urlness' do
      link = Link.new(url: "blahblah", title: "great link")

      expect(link).to_not be_valid
    end
  end

  context 'relationships' do
    it 'has many links' do
      link = Link.new(url: 'http://somethingcool')

      expect(link).to respond_to(:user)
    end
  end
end
