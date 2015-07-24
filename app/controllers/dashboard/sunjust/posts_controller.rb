class Dashboard::Sunjust::PostsController < Dashboard::Sunjust::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
    if @post.save

    format.html { redirect_to dashboard_sunjust_products_path, notice: '新增訊息成功'}
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
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to :back, notice: '成功修改資料'
    else
      render :edit, notice: '修改失敗'
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_sunjust_products_path, notice:'訊息已刪除'

  end

  private
  def set_post
    @post = Post.find(params[:id])
  end 
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
