# frozen_string_literal: true

require "capybara"
require "capybara/wsl/distros"

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
      Capybara.current_session.save_screenshot(path, options).tap do |p_path|
        wsl_path = modify_path(p_path)
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
      path.gsub "/home/", "file://///wsl$/#{distro_folder_name}/home/"
    end

    def self.distro_folder_name
      return distro if distro.is_a?(String)

      DISTROS[distro]
    end
  end
end
