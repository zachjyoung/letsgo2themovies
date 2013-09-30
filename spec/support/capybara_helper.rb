module Capybara
  class Session
    def has_image?(src)
      has_xpath?("#{src}")
    end
  end
end