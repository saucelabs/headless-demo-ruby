require "spec_helper"

describe "Authentication" do
  before { @browser.goto 'http://saucedemo.headless.saucelabs.com'}

  it "successful" do
  	@browser.text_field(data_test: 'username').set 'standard_user'
    @browser.text_field(data_test: 'password').set 'secret_sauce'
    @browser.button(type: 'submit').click

    expect(@browser.url).to eq 'http://saucedemo.headless.saucelabs.com/inventory.html'
  end
end
