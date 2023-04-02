require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validated all valid attributes 
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
