# frozen_string_literal: true

require_relative "errors"

module Capybara
  module WSL
    module Path
      def self.get
        path = `wslpath -m "/"`&.strip

        if path.empty?
          raise(Capybara::WSL::CannotDetectWSLPath,
            "Cannot detect WSL path. Are you sure you're running WSL?")
        end

        "file:///#{path}"
      end
    end
  end
end
