require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "the product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "the proce must be positive" do
    product = Product.new(title: "test product",
                          description: "test product description",
                          image_url: "zzz.jpg")

    product.price = -1
    product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

  end

  def create_product(image_url)
    product = Product.new(
      title: "test product",
      description: "test pr descr",
      price: 99.99,
      image_url: image_url
    )
  end

  test "image_url" do
    ok = %w{ fred.jpg a.jpeg d.png sda.gif }
    bad = %w{ adas.jpg/more sada.doc asdasd.com }

    ok.each do |image_url|
      assert create_product(image_url).valid?, "#{image_url} should be valid"
    end

    bad.each do |image_url|
      assert create_product(image_url).invalid?, "#{image_url} should be invalid"
    end
  end

  test "title should be at least 10 characters long" do
    product = Product.new(title: "test")

    assert product.invalid?
    assert product.errors[:title].any?
  end
end
