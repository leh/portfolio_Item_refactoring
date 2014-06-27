class AddMediumImageUidToPortfolioItemImages < ActiveRecord::Migration
  def change
    add_column :portfolio_item_images, :medium_image_uid, :string
  end
end
