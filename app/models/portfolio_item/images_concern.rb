module PortfolioItem::ImagesConcern
  
  extend ActiveSupport::Concern
 
  included do
    has_many :images, dependent: :destroy
    private :images, :images= # only use images through the methods #tile_widget_uploaded_image
  end

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
