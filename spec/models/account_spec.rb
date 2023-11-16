require 'rails_helper'
RSpec.describe Account, type: :model do
  it 'is not valid without a user_name' do
    kong = Account.create(
      password:'12345',
      email:'blabla@gmail.com'
      )
    expect(kong.errors[:user_name]).to_not be_empty
  end
  it 'is not valid without a password' do
    kong = Account.create(
      user_name:'joseph',
      email:'blabla@gmail.com'
    )
    expect(kong.errors[:password]).to_not be_empty
  end
  it 'is not valid without an email' do
    kong = Account.create(
      user_name:'joseph',
      password:'12345'
    )
    expect(kong.errors[:email]).to_not be_empty
  end

    it 'is not valid if the user_name is less than 5 characters' do
      kong = Account.create(
        user_name:'Joe', 
        email:'blahblah@gmail.com',
        password:'12345'
      )
      expect(kong.errors[:user_name]).to_not be_empty
    end

    it 'does not allow duplicate user_names' do
      kong = Account.create(
        user_name:'joseph', 
        email:'blahblah@gmail.com',
        password:'123456'
      )
      king = Account.create(
        user_name:'joseph',
        email:'abc@gmail.com',
        password:'123456'
      )  
      expect(king.errors[:user_name]).to_not be_empty
    end

    it 'is not valid if the password is less than 6 characters' do
      kong = Account.create(
      user_name: 'Joseph',
      email: 'blahblah@gmail.com',
      password:'12345'
      )
      expect(kong.errors[:password]).to_not be_empty
  end
  it 'is does not allow duplicate passwords' do
    kong = Account.create(
      user_name:'Joseph', email:'abc@gmail.com',
      password:'1234567'
    )
    king = Account.create(
      user_name:'Will',
      email:'abcd@gmail.com',
      password:'1234567'
    )
    expect(king.errors[:password]).to_not be_empty 
  end
end


