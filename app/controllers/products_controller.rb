class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(3)
  end

  def show 
    @product = Product.find(params[:id])
  end
end
