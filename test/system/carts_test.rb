require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  test "hiding the cart if empty" do
    visit store_index_url

    click_on 'Add to Cart', match: :first
    click_on 'Add to Cart', match: :first
    click_on 'Add to Cart', match: :first

    assert_selector :css, "#checkout-button[value=Checkout]"

    click_on 'Empty cart'

    page.accept_alert

    assert_no_selector "#js-cart"
  end
end
