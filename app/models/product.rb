class Product < ActiveRecord::Base
  has_many :photos, :inverse_of => :product, :dependent => :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, :presence => {:message => "產品名稱不得為空"}

end
