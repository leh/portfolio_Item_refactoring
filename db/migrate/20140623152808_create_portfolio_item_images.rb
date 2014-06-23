class CreatePortfolioItemImages < ActiveRecord::Migration
  def change
    create_table :portfolio_item_images do |t|
      t.string :name
      t.string :kind
      t.string :image_uid
      t.string :image_mime_type
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.datetime :image_updated_at
      t.belongs_to :portfolio_item

      t.timestamps
    end
  end
end
