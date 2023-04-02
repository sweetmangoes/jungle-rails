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
    it 'email already exists in the database' do 
      existing_user =  User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: '1234', 
        password_confirmation: '1234'   
      )

      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@test.com',
        password: '1234', 
        password_confirmation: '1234' 
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("Email has already been taken")
    end 

    # user submits without an email
    it 'user submited without an email' do 
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: nil,
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("Email can't be blank")
    end 

    # user submits without a first name
    it 'user submited without a first name' do 
      user = User.create(
        first_name: nil,
        last_name: 'Alph',
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("First name can't be blank")
    end 

    # user submits without a last name
    it 'user submited without a first name' do 
      user = User.create(
        first_name: 'chris',
        last_name: nil,
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.errors.full_messages
      expect(user.errors.full_messages[0]).to eq("Last name can't be blank")
    end 
  end 

  describe 'authenticate_with_credentials' do
    # return proper credentials
    it 'user has correct credentials' do
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.authenticate_with_credentials
      expect(User.authenticate_with_credentials('test@car.ca', '1234')).to eq(user)
    end

    # wrong credentials
    it 'user incorrect credentials' do
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.authenticate_with_credentials
      expect(User.authenticate_with_credentials('test@car.ca', 'abcd')).not_to eq(user)
    end

    # leading/trailing spaces
    it 'user emails with leading/trailing spaces in the email authenticates ' do
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.authenticate_with_credentials
      expect(User.authenticate_with_credentials(' test@car.ca  ', '1234')).to eq(user)
    end

    # return user with capitalized letters in the email
    it 'user emails with capitalized characters in the email authenticates ' do
      user = User.create(
        first_name: 'Chris',
        last_name: 'Alph',
        email: 'test@car.ca',
        password: '1234', 
        password_confirmation: '1234'    
      )
      # puts user.authenticate_with_credentials
      expect(User.authenticate_with_credentials(' tEst@caR.ca', '1234')).to eq(user)
    end
  end

end
