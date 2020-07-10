 capybara-wsl
=======================
[![Gem Version](https://badge.fury.io/rb/capybara-wsl.svg)](https://badge.fury.io/rb/capybara-wsl)

#### Allows you use open saved pages from WSL

Capybara's `save_and_open_page` and `save_and_open_screenshot` methods don't work properly in WSL. Capybara saves pages/screenshots, but then it tries to open them via Launchy and there are several problems with that. We don't want to mess with GUI on WSL, we just want to open them in a Windows browser. However, Capybara passes a Linux path to Launchy, which obviously wouldn't work in Windows browsers.

This gem modifies that path to include `wsl$` part so that it's understandable for Windows browsers. It automatically detects your current WSL distro (since version 0.3.0).

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
In your `.bashrc` add (notice the quotes):
```
export BROWSER="'/mnt/c/Program Files/Mozilla Firefox/firefox.exe'"
```

### Usage
Simply use
 `save_and_open_page_wsl` or
 `save_and_open_screenshot_wsl` instead of their normal versions. You can use same arguments.

 If you installed via `gem install`:
 Run `gem which capybara-wsl` in your console and copy output.
 Use as:
 ```
 require "copied output"
 Capybara::WSL.save_and_open_page
 Capybara::WSL.save_and_open_screenshot
 ```
