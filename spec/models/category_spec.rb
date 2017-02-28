require 'rails_helper'

describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it 'is invalid without a name' do
        cat = Category.new(name: '')

        expect(cat).to be_invalid
      end

      it 'is invalid without a uniqe name' do
        Category.create(name: 'test')
        cat = Category.create(name: 'test')

        expect(cat).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a unique name' do
        cat = Category.create(name: 'test')

        expect(cat).to be_valid
      end
    end
  describe 'relationships' do
    it 'has many beans' do
      cat = Category.create(name: 'test')
      cat.beans.create(title: "Ethiopian Wazzala",
                       description: "Light roasted Yirgacheffe",
                       price: 17,
                       image: "wazzala.jpg")
      cat.beans.create(title: 'test',
                       description: 'test',
                       price: 12,
                       image: 'test.jpg')
      expect(cat).to respond_to(:beans)
      expect(cat.beans.count).to eq 2
    end
  end
end
end
