class ShinlinController < ApplicationController

  def index
    @products = Product.all.sample(6)
    @post = Post.last
  end
end
