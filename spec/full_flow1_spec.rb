require "spec_helper"

describe "FullFlow1" do
  before { @browser.goto 'http://saucedemo.headless.saucelabs.com'}

  it "does stuff" do
    @browser.text_field(data_test: 'username').set 'locked_out_user'
    @browser.text_field(data_test: 'password').set 'secret_sauce'
    @browser.button(type: 'submit').click

    expect(@browser.button(class: 'error-button')).to exist

  	@browser.text_field(data_test: 'username').set 'standard_user'
    @browser.text_field(data_test: 'password').set 'secret_sauce'
    @browser.button(type: 'submit').click

    expect(@browser.url).to eq 'http://saucedemo.headless.saucelabs.com/inventory.html'

    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    @browser.button(class: 'remove-from-cart-button').click
    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '1'

    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 1
    
    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '2'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 2

    @browser.goto "http://saucedemo.headless.saucelabs.com/inventory.html"
    @browser.button(class: 'add-to-cart-button').click
    @browser.button(class: 'add-to-cart-button').click

    expect(@browser.span(class: 'shopping_cart_badge').text).to eq '4'
    @browser.goto "http://saucedemo.headless.saucelabs.com/cart.html"
    expect(@browser.divs(class: 'inventory_item_name').size).to eq 4
  end
  
end
