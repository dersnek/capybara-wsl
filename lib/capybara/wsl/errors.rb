# frozen_string_literal: true

module Capybara
  module WSL
    class CapybaraWSLError < StandardError; end
    class CannotDetectWSLPath < CapybaraWSLError; end
  end
end
