require 'spec_helper'

describe PortfolioItem::Image do
  let(:image) { PortfolioItem::Image.new }

  it "saves images and some values" do
    image.image = File.open(Rails.root.join('spec/fixtures/test.gif'))
    image.image.mime_type.should eql('image/gif')
    image.save!

    image = PortfolioItem::Image.first
    image.image_size.should eql(1047707)
    image.image_width.should eql(400)
    image.image_height.should eql(154)

    # FIXME why doesn't this work
    # image.image_mime_type.should eql('image/gif')
  end
end
