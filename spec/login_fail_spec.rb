require "spec_helper"

describe "Authentication" do
  before { @browser.goto 'saucedemo.headless.saucelabs.com'}

  it "fails" do
    @browser.text_field(data_test: 'username').set 'locked_out_user'
    @browser.text_field(data_test: 'password').set 'secret_sauce'
    @browser.button(type: 'submit').click

    expect(@browser.button(class: 'error-button')).to exist
  end
end
