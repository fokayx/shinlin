module ApplicationHelper
  def img_blank (product)
    if product.photos.empty?
      image_tag"default.jpg"
    end
  end
end
