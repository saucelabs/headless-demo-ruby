require "spec_helper"

describe "Cart" do
  before { @browser.goto 'saucedemo.headless.saucelabs.com/inventory.html'}

  it "adds three" do
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '3'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 3
  end

  it "adds two" do
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '2'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 2
  end
end
