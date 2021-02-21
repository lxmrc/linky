require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'destination and description are present' do
    link = Link.create(title: 'Example.com',
                       destination: 'http://example.com',
                       description: 'Check this out!')

    it 'is valid' do
      expect(link).to be_valid
    end
  end

  context 'only destination is present' do
    link = Link.create(title: 'Example.com',
                       destination: 'http://example.com')

    it 'is valid' do
      expect(link).to be_valid
    end
  end

  context 'destination is not present' do
    link = Link.create()

    it 'is not valid' do
      expect(link).to_not be_valid
    end
  end

  context 'destination is not a valid URL' do
    link = Link.create(destination: 'not a valid URL')

    it 'is not valid' do
      expect(link).to_not be_valid
    end
  end

  context 'has just been created' do
    link = Link.create(destination: 'http://example.com')

    it 'has a score of zero to begin with' do
      expect(link.score).to eq 0
    end
  end
end
