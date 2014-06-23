require 'spec_helper'

describe PortfolioItem do

  let(:portfolio_item) { PortfolioItem.new }

  it "saves the different associations" do

    portfolio_item.save!
    foo_image = portfolio_item.images.create(name: "foo", kind: "foo")
    portfolio_item.images.create(name: "bar", kind: "bar")
    portfolio_item.images.create(name: "baz", kind: "baz")
    portfolio_item.images.create(name: "baz")

    portfolio_item.images.count.should eql(4)
    portfolio_item.images.where("kind IS NOT NULL").count.should eql(3)

    image = portfolio_item.bar_images.create(name: "bar2")
    image.kind.should eql("bar")
    portfolio_item.bar_images.count.should eql(2)
    portfolio_item.bar_images.map(&:name).should eql(['bar', 'bar2'])


    image = portfolio_item.foo_image
    image.should eql(foo_image)
    image.kind.should eql("foo")
    portfolio_item.foo_image.destroy

    portfolio_item.build_foo_image(name: "torial")
    image = portfolio_item.foo_image
    image.name.should eql("torial")
    portfolio_item.foo_image.destroy

    image = PortfolioItem::Image.create!(name: "torial2")
    portfolio_item.foo_image = image
    # BEWARE: image.kind == nil

  end

end
