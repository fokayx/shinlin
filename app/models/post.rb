class Post < ActiveRecord::Base
  validates :title, :presence => {:message => "標題不能空白"}

end
