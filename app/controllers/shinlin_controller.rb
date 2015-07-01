class ShinlinController < ApplicationController

  def index
    @products = Product.order("rand()").limit(6)
  end
end
