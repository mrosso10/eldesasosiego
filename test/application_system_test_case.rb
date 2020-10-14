require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: (ENV["HEADLESS_CHROME"] ? :headless_chrome : :chrome), screen_size: [1400, 1400]

  def setup
    Capybara.server = :puma, { Silent: true }
    super
  end
end
