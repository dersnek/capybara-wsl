# frozen_string_literal: true

require "capybara"
require "capybara/dsl"
require_relative "wsl/dsl"

module Capybara
  module WSL
    class CapybaraWSLError < StandardError; end
    class CannotDetectWSLPath < CapybaraWSLError; end

    def self.save_and_open_page(path = nil)
      Capybara.current_session.save_page(path).tap do |s_path|
        open_file(s_path)
      end
    end

    def self.save_and_open_screenshot(path = nil, **options)
      Capybara.current_session.save_screenshot(path, options).tap do |s_path|
        open_file(s_path)
      end
    end

    private

    def self.open_file(path)
      wsl_path = modify_path(path)
      Capybara.current_session.send(:open_file, wsl_path)
    end

    def self.modify_path(path)
      path.prepend(detect_path)
    end

    def self.detect_path
      path = `wslpath -m "/"`&.strip

      if path.empty?
        raise(Capybara::WSL::CannotDetectWSLPath,
          "Cannot detect WSL path. Are you sure you're running WSL?")
      end

      "file:///#{path}"
    end
  end
end

# Add WSL-relared methods to Capybara's DSL
Capybara::DSL.include Capybara::WSL::DSL
