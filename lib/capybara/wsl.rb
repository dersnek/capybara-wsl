# frozen_string_literal: true

require "capybara"
require "capybara/dsl"
require_relative "wsl/dsl"
require_relative "wsl/path"

module Capybara
  module WSL
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
      path.prepend(Path.get)
    end
  end
end

# Add WSL-relared methods to Capybara's DSL
Capybara::DSL.include Capybara::WSL::DSL
