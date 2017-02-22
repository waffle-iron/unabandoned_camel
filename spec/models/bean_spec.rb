require 'rails_helper'

describe Bean, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a unique title" do
        bean = Bean.create(title: "Ethiopian Wazzala",
                           description: "Light roasted Yirgacheffe",
                           price: 17,
                           image: "wazzala.jpg")
        bean2 = Bean.new(title: "Ethiopian Wazzala",
                         description: "Light roasted Yirgacheffe",
                         price: 17,
                         image: "wazzala.jpg")

        expect(bean2).to be_invalid
      end

      it "is invalid without a title" do
        bean = Bean.new(description: "Light roasted Yirgacheffe",
                        price: 17,
                        image: "wazzala.jpg")

        expect(bean).to be_invalid
      end

      it "is invalid without a description" do
        bean = Bean.new(title: "Ethiopian Wazzala",
                        price: 17,
                        image: "wazzala.jpg")

        expect(bean).to be_invalid
      end

      it "is invalid without a price" do
        bean = Bean.create(title: "Ethiopian Wazzala",
                           description: "Light roasted Yirgacheffe",
                           image: "wazzala.jpg")
        expect(bean).to be_invalid
      end

      it "is invalid without an image" do
        bean = Bean.create(title: "Ethiopian Wazzala",
                           description: "Light roasted Yirgacheffe",
                           price: 17)
        expect(bean).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a unique title, description, price, and image" do
        bean = Bean.create(title: "Ethiopian Wazzala",
                           description: "Light roasted Yirgacheffe",
                           price: 17,
                           image: "wazzala.jpg")
        expect(bean).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'has many categories' do
      category = Category.create(name:'coffee')
      category2 = Category.create(name:'tasty')
      bean = category.beans.create(title: "Ethiopian Wazzala",
                         description: "Light roasted Yirgacheffe",
                         price: 17,
                         image: "wazzala.jpg")
      bean.categories << category2
      expect(bean).to respond_to(:categories)
      expect(bean.categories.count).to eq 2
    end
  end
end
