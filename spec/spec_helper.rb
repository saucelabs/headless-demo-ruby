require "watir"
require 'sauce_whisk'

RSpec.configure do |config|
  def platforms
    platforms_file = "platforms-#{ENV['PLATFORM_FILE']}"
    YAML.safe_load(IO.read("spec/#{platforms_file}.yml"))
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
           url: ENV['SAUCE_URL'],
           username: ENV['SAUCE_USERNAME'],
           accessKey: ENV['SAUCE_KEY']}

    opt.merge! platform

    @browser = Watir::Browser.new opt.delete('browser_name'), opt
  end

  config.after(:each) do |example|
    @browser.quit
  end
end
