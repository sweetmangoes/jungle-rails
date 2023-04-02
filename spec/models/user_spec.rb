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
    # no password by the uses 
    # existing email within database
    # case sensitive 
  end 

  describe '.authenticate_with_credentials' do
    # return proper credentials
    # wrong credentials
    # leading/trailing spaces 
    # return user with capitalized letters in the email
  end

end
