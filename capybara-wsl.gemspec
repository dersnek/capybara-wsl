# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = "capybara-wsl"
  s.version     = "0.0.1"
  s.date        = "2020-06-24"
  s.summary     = "WSL support for Capybara"
  s.description = "Allows Capybara to open pages/screenshots in Windows browsers via Launchy."
  s.authors     = ["Mark Tityuk"]
  s.email       = "mark.tityuk@gmail.com"
  s.files       = ["lib/capybara-wsl.rb"]
  s.homepage    = "https://github.com/dersnek/capybara-wsl"
  s.license     = "MIT"

  s.add_runtime_dependency "capybara", "~> 2.0"
  s.add_dependency "launchy"
end
