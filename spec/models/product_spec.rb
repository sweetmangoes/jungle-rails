require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.create(name: 'category')

  describe 'Validations' do

    it 'is valid with all attributes' do
    end
    
    # checks if all is valid
    #  validates :name, presence: true
    #  validates :price, presence: true
    #  validates :quantity, presence: true
    #  validates :category, presence: true
  end

end