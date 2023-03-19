class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book", except: :index
  def show
    @category_count = Category.count 
    @product_count = Product.count
  end
end
