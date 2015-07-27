class Dashboard::Sunjust::ProductsController < Dashboard::Sunjust::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(name: :asc)
    @posts = Post.order(created_at: :DESC)
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
    if @product.save
      if params[:images]
        params[:images].each { |image|
          @product.photos.create(image: image)
        }
      end

    format.html { redirect_to dashboard_sunjust_products_path, notice: '新增產品成功'}
    format.json { render json: @product, status: :created, location: @product }
    else
      format.html {render :new}
      format.json { render json: @product.errors, status: :unprocessable_entity}
    end
    end
  #   redirect_to products_path, notice: '新增產品成功'
  # else 
  #   render :new
  # end
  end

  def show
    @photos = @product.photos.all
  end

  def edit
  end

  def update
    if @product.update(product_params)
      if params[:images]
        params[:images].each { |image|
          @product.photos.create(image: image)
        }
      end
      redirect_to :back, notice: '成功修改資料'
    else
      render :edit, notice: '修改失敗'
    end
  end

  def destroy
    @product.destroy
    redirect_to dashboard_sunjust_products_path, notice:'產品已刪除'

  end

  private
  def set_product
    @product = Product.find(params[:id])
  end 
  def product_params
    params.require(:product).permit(:name, :texture, :diameter, :size, :surface, photos_attributes: [:id, :images, :product_id])
  end
end
