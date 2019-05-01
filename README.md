## Headless Demo

This code is provided on an "AS-IS” basis without warranty of any kind, either express or implied, including without limitation any implied warranties of condition, uninterrupted use, merchantability, fitness for a particular purpose, or non-infringement. Your tests and testing environments may require you to modify this framework. Issues regarding this framework should be submitted through GitHub. For questions regarding Sauce Labs integration, please see the Sauce Labs documentation at https://wiki.saucelabs.com/. This framework is not maintained by Sauce Labs Support.

### Running in Docker
```
$ docker run -e PROCESSES=8 -e SAUCE_URL=https://us-east-1.saucelabs.com/wd/hub \
  -e PLATFORM_FILE=headless \
  -e SAUCE_USERNAME=<YOUR_SAUCE_USERNAME> -e SAUCE_ACCESS_KEY=<YOUR_ACCESS_KEY> \
  quay.io/saucelabs/headless_demo_ruby
```
### Local Environment Setup

1. Global Dependencies
    * [Install Ruby](http://watir.com/guides/ruby/)
    * [Install Git](https://github.com/address-book/junit_tests#install-git)
    * Clone This Repo
    ```
    $ git clone https://github.com/saucelabs/headless-demo-ruby.git
    ```
    * Install bundler
    ```
    $ gem install bundler
    ```

2. Sauce Credentials
    * In the terminal export your Sauce Labs Credentials as environmental variables:
    ```
    $ export SAUCE_USERNAME=<your Sauce Labs username>
    $ export SAUCE_ACCESS_KEY=<your Sauce Labs access key>
    ```

3. Project Dependencies
	* Install packages
	```
	$ bundle install
	```

### Running Tests

* Specific Configuration (see `/spec/support/platforms.yml` file)
	```
	$ rake mac_sierra_chrome
	```
* Demo Mode, you need a fast computer for this to work.  Tune # of processes down if your workstation/laptop isn't maxed out
	```
	$ PROCESSES=8 SAUCE_URL=https://us-east-1.saucelabs.com/wd/hub PLATFORM_FILE=headless bundle exec rake -j25 sauce_demo
	```

### Watch Your Tests Run

[Sauce Labs Headless Dashboard](https://app.us-east-1.saucelabs.com/dashboard/builds)
