require 'spec_helper'

describe PortfolioItem do

  let(:portfolio_item) { PortfolioItem.create! }
  
  let(:image_fixture) { File.open(Rails.root.join('spec/fixtures/saturn_clean.png')) }

  # older tests & ideas ...
  # it "saves the different associations" do
  #   # create 4 PI::Image objects
  #   foo_image = portfolio_item.images.create(name: "foo", kind: "foo")
  #   portfolio_item.images.create(name: "bar", kind: "bar")
  #   portfolio_item.images.create(name: "baz", kind: "baz")
  #   portfolio_item.images.create(name: "baz")
  #   portfolio_item.images.count.should eql(4)

  #   # kind should be set when given
  #   portfolio_item.images.where("kind IS NOT NULL").count.should eql(3)

  #   # verify kind is passed on to the object from the conditions hash, in has_many association
  #   image = portfolio_item.bar_images.create(name: "bar2")
  #   image.kind.should eql("bar")
  #   portfolio_item.bar_images.count.should eql(2)
  #   portfolio_item.bar_images.map(&:name).should eql(['bar', 'bar2'])

  #   # verify kind is passed on to the object from the conditions hash, in has_one association
  #   image = portfolio_item.foo_image
  #   image.should eql(foo_image)
  #   image.kind.should eql("foo")
  #   portfolio_item.foo_image.destroy

  #   # verify build_foo_image replaces an existing image
  #   portfolio_item.build_foo_image(name: "torial")
  #   image = portfolio_item.foo_image
  #   image.name.should eql("torial")
  #   portfolio_item.foo_image.destroy

  #   # verify image can be assigned
  #   image = PortfolioItem::Image.create!(name: "torial2")
  #   portfolio_item.foo_image = image
  #   # BEWARE: image.kind == nil

  # end

  it "#tile_widget_uploaded_image is not present by default" do
    portfolio_item.tile_widget_uploaded_image.should_not be_present
  end

  describe "#tile_widget_uploaded_image" do

    before do
      portfolio_item.tile_widget_uploaded_image = image_fixture
      #portfolio_item.save!
      #portfolio_item.reload
    end

    it "can be assigned and read" do
      portfolio_item.tile_widget_uploaded_image.should be_a(Dragonfly::Model::Attachment)
    end

    it "the image size can be given to the main method" do
      portfolio_item.tile_widget_uploaded_image(:original).width.should == 1280
    end

    it "the medium image size is generated and can be fetched through the main method" do
      portfolio_item.tile_widget_uploaded_image(:medium).path.should =~ /saturn_clean\.jpg/
      portfolio_item.tile_widget_uploaded_image(:medium).width.should == 660
    end

    it "raises an error on unknown sizes" do
      expect { portfolio_item.tile_widget_uploaded_image(:tiny)}.to raise_error(StandardError, /no such image size/)
    end

  end

end
