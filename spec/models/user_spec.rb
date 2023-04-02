require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validated all valid attributes
    it 'validates all valid attributes' do 
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: '1234', 
        password_confirmation: '1234'    
      )
      
      expect(user).to be_valid
    end 

    # non-matching password and password confirmation 
    it 'non-matching password and password confirmation' do 
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: '1234', 
        password_confirmation: 'abcd'    
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[1]).to eq("Password confirmation doesn't match Password")
    end 

    # no password submitted by user
    it 'user submitted without a password' do 
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: nil, 
        password_confirmation: nil   
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("Password can't be blank")
    end 

    # password length is lesser 4 char
    it 'user submitted password under 4 chars' do 
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: '123', 
        password_confirmation: '123'   
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("Password is too short (minimum is 4 characters)")
    end

    # existing email within database
    # it 'email already exists in the database' do 
    #   user = User.create(
    #     first_name: 'Chris',
    #     last_name: 'Alph',
    #     email: 'test@test.com',
    #     password: nil, 
    #     password_confirmation: nil   
    #   )
    #   # puts user.errors.full_messages
    #   expect(user.errors.full_messages[0]).to eq("Password can't be blank")
    # end 
    # case sensitive 
  end 

  describe '.authenticate_with_credentials' do
    # return proper credentials
    # wrong credentials
    # leading/trailing spaces 
    # return user with capitalized letters in the email
  end

end
