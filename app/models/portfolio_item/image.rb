class PortfolioItem::Image < ActiveRecord::Base
  extend Dragonfly::Model

  attr_accessible :name, :image, :kind

  dragonfly_accessor :image do |foo|

  end

  belongs_to :portfolio_item
end
