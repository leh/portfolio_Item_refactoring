class PortfolioItem < ActiveRecord::Base
  attr_accessible :name

  has_many :images, class_name: PortfolioItem::Image
  has_many :bar_images, conditions: { 'portfolio_item_images.kind' => 'bar' }, class_name: PortfolioItem::Image

  has_one  :foo_image,  conditions: { 'portfolio_item_images.kind' => 'foo' }, class_name: PortfolioItem::Image
end
