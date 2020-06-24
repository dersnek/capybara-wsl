# frozen_string_literal: true

module Capybara
  module WSL
    DISTROS = {
      alpine: "Alpine-WSL",
      centos: "CentOS",
      debian: "Debian",
      fedors: "Fedora-Remix-for-WSL",
      kali: "kali-linux",
      opensuse: "openSUSE-Leap-15-1",
      pengwin: "Pengwin",
      ubuntu: "Ubuntu",
    }.freeze
  end
end
