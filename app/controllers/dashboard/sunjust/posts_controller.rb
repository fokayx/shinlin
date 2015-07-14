class Dashboard::Sunjust::PostsController < Dashboard::Sunjust::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
   @posts = post.all
  end

  def new
    @post = post.new
    @photo = @post.photos.build
  end

  def create
    @post = post.new(post_params)

    respond_to do |format|
    if @post.save
      if params[:images]
        params[:images].each { |image|
          @post.photos.create(image: image)
        }
      end

    format.html { redirect_to dashboard_sunjust_posts_path, notice: '新增產品成功'}
    format.json { render json: @post, status: :created, location: @post }
    else
      format.html {render :new}
      format.json { render json: @post.errors, status: :unprocessable_entity}
    end
    end
  #   redirect_to posts_path, notice: '新增產品成功'
  # else 
  #   render :new
  # end
  end

  def show
    @photos = @post.photos.all
  end

  def edit
  end

  def update
    if @post.update(post_params)
      if params[:images]
        params[:images].each { |image|
          @post.photos.create(image: image)
        }
      end
      redirect_to :back, notice: '成功修改資料'
    else
      render :edit, notice: '修改失敗'
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_sunjust_posts_path, notice:'產品已刪除'

  end

  private
  def set_post
    @post = post.find(params[:id])
  end 
  def post_params
    params.require(:post).permit(:name, :texture, :diameter, :size, :surface, photos_attributes: [:id, :images, :post_id])
  end
end
