class ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.all

    render json: @products
  end
end
