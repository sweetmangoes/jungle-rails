require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.create(name: 'category')

  describe 'Validations' do

    it 'is valid with all attributes' do
      product = Product.new(
        name: 'Name',
        description: 'Description',
        category_id: 1,
        quantity: 10,
        image: 'https://images.pexels.com/photos/53435/tree-oak-landscape-view-53435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 25.99
      )
      expect(product).to be_valid
    end

    #  validates :name, presence: true
    it 'is not valid without a name' do
      product = Product.create(
          name: nil,
          description: 'Description',
          category_id: 1,
          quantity: 10,
          image: 'https://images.pexels.com/photos/53435/tree-oak-landscape-view-53435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          price: 25.99
        )

      expect(product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    #  validates :price, presence: true
    it 'is not valid without a price' do
      product = Product.create(
          name: 'price',
          description: 'Description',
          category_id: 1,
          quantity: 10,
          image: 'https://images.pexels.com/photos/53435/tree-oak-landscape-view-53435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

        )
      
      expect(product.errors.full_messages[2]).to eq("Price can't be blank")
    end

    #  validates :quantity, presence: true
    it 'is not valid without a quantity' do
      product = Product.create(
          name: 'quantity',
          description: 'Description',
          category_id: 1,
          quantity: nil,
          image: 'https://images.pexels.com/photos/53435/tree-oak-landscape-view-53435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          price: 25.99
        )
        
      #  puts product.errors.full_messages
      expect(product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    #  validates :category, presence: true
    it 'is not valid without a category' do
      product = Product.create(
          name: 'category',
          description: 'Description',
          category_id: nil,
          quantity: 4,
          image: 'https://images.pexels.com/photos/53435/tree-oak-landscape-view-53435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          price: 25.99
        )
        
      #  puts product.errors.full_messages
      expect(product.errors.full_messages[0]).to eq("Category must exist")
    end

  end

end