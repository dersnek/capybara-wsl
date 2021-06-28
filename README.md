 capybara-wsl
=======================
[![Gem Version](https://badge.fury.io/rb/capybara-wsl.svg)](https://badge.fury.io/rb/capybara-wsl)

#### Allows you use open saved pages from WSL

Capybara's `save_and_open_page` and `save_and_open_screenshot` methods don't work properly in WSL. Capybara saves pages/screenshots, but then it tries to open them via Launchy and there are several problems with that. We don't want to mess with GUI on WSL, we just want to open them in a Windows browser. However, Capybara passes a Linux path to Launchy, which obviously wouldn't work in Windows browsers.

This gem modifies that path to include `wsl$` part so that it's understandable for Windows and opens it in your default browser. It automatically detects your current WSL distro (since version 0.3.0).
There's no need to manually set the `BROWSER` env variable since version 1.0.0.

### Installation
In your `Gemfile` add:
```
gem "capybara-wsl"
```
Then run `bundle install`.

Or `gem install capybara-wsl`, but then running it is a bit less straightforward.

### Usage
Simply use
```
save_and_open_page_wsl
save_and_open_screenshot_wsl
```
instead of their normal versions. You can use same arguments.

If you installed via `gem install`, use as:
```
require `gem which capybara-wsl`.strip
Capybara::WSL.save_and_open_page
Capybara::WSL.save_and_open_screenshot
```
