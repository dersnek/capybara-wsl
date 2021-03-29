# frozen_string_literal: true

require "dotenv"
require "launchy"
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
      Dotenv.overload!(File.expand_path("#{__FILE__}/../.env"))
      wsl_path = modify_path(path)
      Launchy.open(wsl_path)
    rescue LoadError
      warn "File saved to #{wsl_path}.\nPlease install the launchy gem to open the file automatically."
    end

    def self.modify_path(path)
      path[1..-1].prepend(detect_path).gsub("/", "\\")
    end

    def self.detect_path
      path = `wslpath -m "/"`&.strip

      if path.empty?
        raise(Capybara::WSL::CannotDetectWSLPath,
          "Cannot detect WSL path. Are you sure you're running WSL?")
      end

      "file:#{path}"
    end
  end
end

# Add WSL-related methods to Capybara's DSL
Capybara::DSL.include Capybara::WSL::DSL
