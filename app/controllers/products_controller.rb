class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(18)
  end

  def show 
    @products = Product.all
    @product = Product.find(params[:id])
  end
end
