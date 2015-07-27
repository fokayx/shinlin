class ShinlinController < ApplicationController

  def index
    @products = Product.order("rand()").limit(6)
    @post = Post.last
  end
end
