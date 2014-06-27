class PortfolioItem::Image < ActiveRecord::Base

  extend Dragonfly::Model

  belongs_to :portfolio_item

  attr_accessible :name, :image, :kind

  dragonfly_accessor :image do
    after_assign :generate_medium_image_size
    after_assign :set_image_updated_at
  end

  dragonfly_accessor :medium_image

  private

    def generate_medium_image_size
      self.medium_image = image.thumb("660x>").encode('jpg', '-quality 90')
    end

    def set_image_updated_at
      self.image_updated_at = Time.now
    end

end
