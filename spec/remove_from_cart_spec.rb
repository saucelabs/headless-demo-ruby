require "spec_helper"

describe "Cart" do
  before { @browser.goto 'www.saucedemo.com/inventory.html'}

  it "removes one" do
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    @browser.button(class: 'remove-from-cart-button').click
    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '1'

    @browser.goto "https://www.saucedemo.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 1
    
  end
end
