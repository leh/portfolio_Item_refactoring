require 'spec_helper'

describe PortfolioItem::Image do

  let(:image) { PortfolioItem::Image.new }

  it "saves images and some values" do

    # assign
    image.image = File.open(Rails.root.join('spec/fixtures/test.gif'))
    image.image.mime_type.should eql('image/gif')
    image.save!

    image = PortfolioItem::Image.first
    image.image_size.should eql(1047707)
    image.image_width.should eql(400)
    image.image_height.should eql(154)

    # FIXME why doesn't this work
    #image.image_mime_type.should eql('image/gif')

    #p image.image.public_methods(:false).sort#updated#_at
    #p image.image.meta
  end

  it "on assignment of image, image_updated_at is assigned too" do
    image.image_updated_at.should be_nil
    image.image = File.open(Rails.root.join('spec/fixtures/test.gif'))
    image.image_updated_at.should_not be_nil
  end
end
