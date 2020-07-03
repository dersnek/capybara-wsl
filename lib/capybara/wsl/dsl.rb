module Capybara
  module WSL
    module DSL
      def save_and_open_page_wsl
        Capybara::WSL.save_and_open_page
      end

      def save_and_open_screenshot_wsl
        Capybara::WSL.save_and_open_screenshot
      end
    end
  end
end
