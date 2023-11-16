# frozen_string_literal: true

module Capybara
  module WSL
    module DSL
      def save_and_open_page_wsl(path = nil)
        Capybara::WSL.save_and_open_page(path)
      end

      def save_and_open_screenshot_wsl(path = nil, **options)
        Capybara::WSL.save_and_open_screenshot(path, **options)
      end
    end
  end
end
