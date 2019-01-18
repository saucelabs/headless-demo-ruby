require "watir"
require 'sauce_whisk'

RSpec.configure do |config|
  def platforms
    YAML.safe_load(IO.read('spec/platforms.yml'))
  end

  def platform
    platforms[ENV['PLATFORM']] || platforms.first
  end

  def build_name
    if ENV['BUILD_NAME']
      ENV['BUILD_NAME']
    elsif ENV['TRAVIS_JOB_NUMBER']
      "#{ENV['TRAVIS_REPO_SLUG'][/[^\/]+$/]}: #{ENV['TRAVIS_JOB_NUMBER']}"
    elsif ENV['SAUCE_BAMBOO_BUILDNUMBER']
      ENV['SAUCE_BAMBOO_BUILDNUMBER']
    elsif ENV['CIRCLE_BUILD_NUM']
      "#{ENV['CIRCLE_JOB']}: #{ENV['CIRCLE_BUILD_NUM']}"
    elsif ENV['BUILD_TAG']
      ENV['BUILD_TAG']
    else
      "Local Execution - #{Time.now.to_i}"
    end
  end

  config.before(:each) do |test|
    opt = {name: test.full_description,
           build: build_name,
           url: "http://ondemand.us-east1.headless.saucelabs.com/wd/hub",
           username: 'sah',
           accessKey: ENV['SAUCE_ADMIN_KEY']}

    opt.merge! platform

    @browser = Watir::Browser.new opt.delete('browser_name'), opt
  end

  config.after(:each) do |example|
    @browser.quit
  end
end
