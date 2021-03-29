# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)
require "capybara/wsl/version"

Gem::Specification.new do |s|
  s.name        = "capybara-wsl"
  s.version     = Capybara::WSL::VERSION
  s.summary     = "Open pages/screenshots in WSL from Capybara"
  s.description = "Allows Capybara to open pages/screenshots in Windows browsers via Launchy."
  s.authors     = ["Mark Tityuk"]
  s.email       = "mark.tityuk@gmail.com"
  s.files       = `git ls-files`.split("\n")
  s.homepage    = "https://github.com/dersnek/capybara-wsl"
  s.license     = "MIT"

  s.add_dependency "capybara", ">= 2.0"
  s.add_dependency "launchy", ">= 2.0"
  s.add_dependency "dotenv"
end
