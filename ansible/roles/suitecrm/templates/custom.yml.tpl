# This is an example configuration file that should be copied to a file named custom.yml so
# it can be customized without committing it to git. (custom.yml is ignored by the gitignore).
# This configuration is meant to be used with the Install and Acceptance suites.
# Make sure to install ChromeDriver (with ./vendor/bin/robo chromedriver:install)
# before trying to use this.
#
# See the Codeception documentation for more information on how to configure this file:
# - https://codeception.com/docs/reference/Configuration
# - https://codeception.com/docs/modules/WebDriver
# Also see the SuiteCRM Automated Testing documentation:
# - https://docs.suitecrm.com/developer/automatedtesting/
#

# Uncomment this to run ChromeDriver as a background process whenever the tests are run.
# extensions:
#   enabled:
#     # Run ChromeDriver in the background when acceptance tests are running.
#     - Codeception\Extension\RunProcess:
#         0: ./build/tmp/webdriver/chromedriver --url-base=/wd/hub
#         sleep: 5 # wait 5 seconds for ChromeDriver to start up.
modules:
  enabled:
    - \SuiteCRM\Test\Driver\WebDriver
  config:
    \SuiteCRM\Test\Driver\WebDriver:
      # This URL should be the location of the CRM you want to run
      # tests on, for example "http://localhost:3000".
      url: "{{ suitecrm.url }}"
      # Don't wait before failing if an element isn't on the page.
      # Keep this at 0 to be consistent with how it's run in CI.
      wait: 0
      # ChromeDriver port
      port: "{{ selenium_port }}"
      browser: chrome
      # Clear cookies between test runs to make sure state is reset between
      # every test.
      clear_cookies: true
      # Initial window size, this is set to false for Chrome so it can be
      # configured in the capabilities below.
      window_size: false
      # Set window size to 1920x1080 (you generally shouldn't modify this or it
      # will cause tests to fail). Also run the test suite with a 'headless'
      # Chrome browser, meaning the browser window won't show up while you're
      # running the test suite.
      capabilities:
        acceptInsecureCerts: true
        'goog:chromeOptions':
          w3c: false
          args: ["--no-sandbox", "--headless", "--disable-gpu", "--disable-extensions"]     
            # If the test suite fails to find Chrome, you can uncomment the
            # line below and set the value to your Chrome executable.
            binary: "/usr/bin/google-chrome"
