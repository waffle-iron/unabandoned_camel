require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without email" do
        user = User.create(password: 'password',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           street: '123 Test St',
                           city: 'Test City',
                           state: 'Test State',
                           zip: '12345')

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.create(email: 'test@test.com',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           street: '123 Test St',
                           city: 'Test City',
                           state: 'Test State',
                           zip: '12345')

        expect(user).to be_invalid
      end

      it 'is invalid without a first_name' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           last_name: 'Last Test',
                           street: '123 Test St',
                           city: 'Test City',
                           state: 'Test State',
                           zip: '12345')
        expect(user).to be_invalid
      end

      it 'is invalid without a last name' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           first_name: 'First Test',
                           street: '123 Test St',
                           city: 'Test City',
                           state: 'Test State',
                           zip: '12345')
        expect(user).to be_invalid
      end

      it 'is invalid without a street' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           city: 'Test City',
                           state: 'Test State',
                           zip: '12345')
        expect(user).to be_invalid
      end

      it 'is invalid without a city' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           street: 'Test Street',
                           state: 'Test State',
                           zip: '12345')

        expect(user).to be_invalid
      end

      it 'is invalid without a state' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           city: 'Test City',
                           street: 'Test Street',
                           zip: '12345')

        expect(user).to be_invalid
      end


      it 'is invalid without a zip' do
        user = User.create(email: 'test@test.com',
                           password: 'password',
                           first_name: 'First Test',
                           last_name: 'Last Test',
                           city: 'Test City',
                           street: 'Test Street',
                           state: 'Test State')

        expect(user).to be_invalid
      end
    end

    context "unique attributes" do
      it "is invalid with duplicate email" do
        User.create(email: 'test@test.com',
                    password: 'password',
                    first_name: 'First Test',
                    last_name: 'Last Test',
                    city: 'Test City',
                    street: 'Test Street',
                    state: 'Test State',
                    zip: '12345')
        user = User.create(email: 'test@test.com',
                           password: 'password1',
                           first_name: 'First Test1',
                           last_name: 'Last Test1',
                           city: 'Test City1',
                           street: 'Test Street1',
                           state: 'Test State1',
                           zip: '123451')

        expect(user).to be_invalid
      end
    end
  end
end
