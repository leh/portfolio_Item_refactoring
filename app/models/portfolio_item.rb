class PortfolioItem < ActiveRecord::Base

  include PortfolioItem::ImagesConcern

  # older tests & ideas ...
  #has_many :bar_images, conditions: { 'portfolio_item_images.kind' => 'bar' }, class_name: PortfolioItem::Image
  #has_one  :foo_image,  conditions: { 'portfolio_item_images.kind' => 'foo' }, class_name: PortfolioItem::Image

end
