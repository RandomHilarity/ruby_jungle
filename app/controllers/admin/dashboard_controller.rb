class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']

  def show
    @products_count = Product.all.count
    @catagories_count = Category.all.count
  end
end
