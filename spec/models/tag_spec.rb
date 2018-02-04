require 'rails_helper'

describe Tag, type: :model do
  describe 'relationships' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'instance methods' do
    describe '#to_s' do
      it 'returns the tag name' do
        tag = Tag.new(name: 'nature')

        expect(tag.to_s).to eq(tag.name)
      end
    end
  end
end
