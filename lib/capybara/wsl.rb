# frozen_string_literal: true

require "capybara"
require "capybara/dsl"
require_relative "wsl/distros"
require_relative "wsl/dsl"

module Capybara
  module WSL
    class CapybaraWSLError < StandardError; end
    class DistroKeyNotSupported < CapybaraWSLError; end

    def self.save_and_open_page(path = nil)
      Capybara.current_session.save_page(path).tap do |s_path|
        wsl_path = modify_path(s_path)
        Capybara.current_session.send(:open_file, wsl_path)
      end
    end

    def self.save_and_open_screenshot(path = nil, **options)
      Capybara.current_session.save_screenshot(path, options).tap do |s_path|
        wsl_path = modify_path(s_path)
        Capybara.current_session.send(:open_file, wsl_path)
      end
    end

    def self.distro
      @distro || :ubuntu
    end

    def self.distro=(name)
      if name.is_a?(Symbol) && DISTROS[name].nil?
        raise(Capybara::WSL::DistroKeyNotSupported,
              "This distro key is not supported. Please use supported key or pass a string with exact distro folder name.")
      end

      @distro = name
    end

    private

    def self.modify_path(path)
      path.prepend("file://///wsl$/#{distro_folder_name}")
    end

    def self.distro_folder_name
      return distro if distro.is_a?(String)

      DISTROS[distro]
    end
  end
end

# Add WSL-relared methods to Capybara's DSL
Capybara::DSL.include Capybara::WSL::DSL
