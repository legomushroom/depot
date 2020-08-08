require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  setup do
    @cart = Cart.new
  end

  def log(value)
    Rails::logger.debug "#{self.class.name} #{value}"
  end

  test "add product to the cart #same" do
    @cart.add_product(products(:ruby))
    @cart.save!

    @cart.add_product(products(:ruby))
    @cart.save!

    assert @cart.line_items.count == 1
  end

  test "add product to the cart #same #multy" do
    @cart.add_products([ products(:ruby), products(:ruby) ])
    @cart.save!

    log @cart.line_items.count

    assert @cart.line_items.count == 1
  end

  test "add product to the cart #different" do
    @cart.add_product(products(:one))
    @cart.save!

    @cart.add_product(products(:one))
    @cart.save!

    assert @cart.line_items.count == 1
  end
end
