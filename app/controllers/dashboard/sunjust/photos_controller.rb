class Dashboard::Sunjust::PhotosController < Dashboard::Sunjust::BaseController
  before_action :set_photo, only: [:edit, :update, :destroy]
#
#  def edit
#  end
#  def update
#    if @photo.update(photo_params)
#      redirect_to edit_dashboard_sunjust_photo_path, notice: 'Photo image update'
#    end
#  end
#
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to edit_dashboard_sunjust_product_path(@photo.product.id)
  end


  private
  def set_photo 
    @photo = Photo.find(params[:id])
  end
#
#  def photo_params
#    params.require(:photo).permit(:image)
#  end
end
