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
    # examples for this class method here
  end

end
