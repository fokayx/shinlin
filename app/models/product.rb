class Product < ActiveRecord::Base
  has_many :photos, :inverse_of => :product, :dependent => :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true
end
