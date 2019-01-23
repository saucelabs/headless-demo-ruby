require "spec_helper"

describe "Inventory" do
  it 'does stuff' do
    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click
    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '1'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 1
  end

  it 'does more' do
    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '3'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 3
  end
  
end
