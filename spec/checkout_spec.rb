require "spec_helper"

describe "Checkout" do
  it 'adds an item to the cart' do
    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    @browser.button(class: 'remove-from-cart-button').click
    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '1'

    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 1
  end
  it 'goes to the checkout page' do
    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click

    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    @browser.link(class: 'cart_checkout_link').click
    expect(@browser.url).to eq 'http://saucedemo.headless.saucelabs.com/checkout-step-one.html'
  end
end
