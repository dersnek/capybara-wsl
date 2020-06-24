# frozen_string_literal: true

require "capybara"

module Capybara
  module WSL
    def self.save_and_open_page(path = nil)
      Capybara.current_session.save_page(path).tap do |s_path|
        wsl_path = modify_path(s_path)
        Capybara.current_session.send(:open_file, wsl_path)
      end
    end

    def self.save_and_open_screenshot(path = nil, **options)
      Capybara.current_session.save_screenshot(path, options).tap do |p_path|
        wsl_path = modify_path(p_path)
        Capybara.current_session.send(:open_file, wsl_path)
      end
    end

    private

    def self.modify_path(path)
      path.gsub "/home/", "file://///wsl$/Ubuntu/home/"
    end
  end
end
