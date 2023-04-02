require 'rails_helper'

# validation tests/examples here
#  validates :name, presence: true
#  validates :price, presence: true
#  validates :quantity, presence: true
#  validates :category, presence: true

RSpec.describe Product, type: :model do
  category = Category.create(name: 'category')

  describe 'Validations' do
    # validation tests/examples here

  end
end