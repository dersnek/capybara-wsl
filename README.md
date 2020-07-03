 CapybaraWSL
=======================

#### Allows you use open saved pages from WSL

Capybara's `save_and_open_page` and `save_and_open_screenshot` methods don't work properly in WSL. It saves pages/screenshots, but when it tries to open them via Launchy, it passes Linux path, which obviously wouldn't work in Windows browsers.

This gem modifies that path to include `wsl$` part so that it's understandable for Windows browsers.

### Installation
In your `Gemfile` add:
```
gem "capybara-wsl"
```
Then run `bundle install`.

Or `gem install capybara-wsl`, but then running it is a bit less straightforward.

### Important note
In order for it to work, you have to add `$BROWSER` env variable.
###### Example for Firefox
In your `.bashrc` add:
```
export BROWSER='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
```

### Usage
Simply use
 `save_and_open_page_wsl` or
 `save_and_open_screenshot_wsl` instead of their normal versions.

 If you installed via `gem install`:
 Run `gem which capybara-wsl` in your console and copy output.
 Use as:
 ```
 require "copied output"
 Capybara::WSL.save_and_open_page
 Capybara::WSL.save_and_open_screenshot
 ```

CapybaraWSL converts page/screenshot path to WSL Ubuntu path by default. If you have another distro, please set the `distro` setting `Capybara::WSL.distro = :debian` to whichever distro you are using.
You can look up available distro keys in `Capybara::WSL::DISTROS`. You can also set `distro` to a string with exact folder name of your distro `Capybara::WSL.distro = "openSUSE-Leap-15-1"`.

Please tell me if some of those distro folder names in `Capybara::WSL::DISTROS` are incorrect, I don't really have a way to check it.
