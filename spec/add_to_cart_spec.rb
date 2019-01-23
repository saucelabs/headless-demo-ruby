require "spec_helper"

describe "Cart" do
  before { @browser.goto 'www.saucedemo.com/inventory.html'}

  it "adds three" do
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '3'
    @browser.goto "https://www.saucedemo.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 3
  end

  it "adds two" do
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '2'
    @browser.goto "https://www.saucedemo.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 2
  end
end
