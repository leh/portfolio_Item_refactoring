class PortfolioItem::Image < ActiveRecord::Base

  extend Dragonfly::Model

  # older tests & ideas ...
  #belongs_to :portfolio_item # maybe we can even prevent making this association available here ...
  #attr_accessible :name, :image, :kind

  dragonfly_accessor :image do
    after_assign :generate_medium_image
    after_assign :set_image_updated_at
  end

  dragonfly_accessor :medium_image

  private

    def generate_medium_image
      # "-quality 90 -strip -unsharp 0x0.5"
      self.medium_image = image.thumb("660x>").encode('jpg', '-quality 90')
    end

    def set_image_updated_at
      self.image_updated_at = Time.now
    end

end
