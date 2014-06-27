class PortfolioItem < ActiveRecord::Base
  attr_accessible :name

  has_many :images, class_name: PortfolioItem::Image

  # old ideas
  has_many :bar_images, conditions: { 'portfolio_item_images.kind' => 'bar' }, class_name: PortfolioItem::Image
  has_one  :foo_image,  conditions: { 'portfolio_item_images.kind' => 'foo' }, class_name: PortfolioItem::Image

  def tile_widget_uploaded_image(size = :original)
    association = images.find_by_origin(:tile_widget_upload) || return
    if (size == :original)
      association.image
    elsif association.respond_to?(:"#{size}_image")
      association.send(:"#{size}_image")
    else 
      raise "Sorry, no such image size."
    end
  end

  def tile_widget_uploaded_image=(image_file)
    association = images.find_or_initialize_by_origin(:tile_widget_upload)
    association.image = image_file
    association.save!
    tile_widget_uploaded_image
  end
end
